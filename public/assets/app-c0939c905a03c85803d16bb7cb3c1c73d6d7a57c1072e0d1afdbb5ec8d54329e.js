(function() {
  window.App || (window.App = {});

  $(document).on('ready page:load', function() {
    return $(document).on('click', '#test', function(e) {
      return e.preventDefault();
    });
  });

}).call(this);
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.Element || (window.Element = {});

  Element.Toast = (function() {
    function Toast() {
      this.setOption = bind(this.setOption, this);
      this.setOption();
    }

    Toast.prototype.setOption = function() {
      return $.toast.options = {
        text: '',
        heading: '',
        showHideTransition: 'fade',
        allowToastClose: true,
        hideAfter: 4000,
        stack: 5,
        position: {
          right: 16,
          top: 1
        },
        bgColor: false,
        textColor: false,
        textAlign: 'left',
        icon: false,
        beforeShow: function() {},
        afterShown: function() {},
        beforeHide: function() {},
        afterHidden: function() {}
      };
    };

    return Toast;

  })();

}).call(this);
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.Element || (window.Element = {});

  Element.Toolbar = (function() {
    function Toolbar(element, option) {
      this.setOption = bind(this.setOption, this);
      this.element = $(element);
      this.option = option;
      this.setOption();
      return this;
    }

    Toolbar.prototype.setOption = function() {
      return this.element.toolbar({
        content: this.option,
        position: 'bottom',
        event: 'click',
        hideOnClick: true
      });
    };

    return Toolbar;

  })();

}).call(this);
(function() {
  window.Utility || (window.Utility = {});

  Utility.Confirmation = (function() {
    function Confirmation() {
      $.rails.allowAction = function(link) {
        if (!link.attr('data-confirm')) {
          return true;
        }
        $.rails.showConfirmDialog(link);
        return false;
      };
      $.rails.confirmed = function(link) {
        link.removeAttr('data-confirm');
        return link.trigger('click.rails');
      };
      $.rails.showConfirmDialog = function(link) {
        var box, message;
        message = link.attr('data-confirm');
        box = bootbox.confirm(message, function(result) {
          if (result) {
            return $.rails.confirmed(link);
          }
        });
        return box;
      };
      return this;
    }

    return Confirmation;

  })();

}).call(this);
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.Utility || (window.Utility = {});

  Utility.Masonry = (function() {
    function Masonry(boxes, container) {
      this.refresh = bind(this.refresh, this);
      this.setOption = bind(this.setOption, this);
      this.boxes = $(boxes);
      this.container = $(container);
      this.box = boxes;
      this.setOption();
    }

    Masonry.prototype.setOption = function() {
      this.boxes.hide();
      return this.container.imagesLoaded((function(_this) {
        return function() {
          _this.boxes.fadeIn();
          return _this.container.masonry({
            itemSelector: _this.box,
            isFitWidth: true,
            isAnimated: !Modernizr.csstransitions
          });
        };
      })(this));
    };

    Masonry.prototype.refresh = function() {
      console.log("refresh");
      return this.container.masonry({
        itemSelector: this.box,
        isFitWidth: true
      }).imagesLoaded((function(_this) {
        return function() {
          return _this.container.masonry('reload');
        };
      })(this));
    };

    return Masonry;

  })();

}).call(this);
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.Utility || (window.Utility = {});

  Utility.Modal = (function() {
    function Modal() {
      this.handleEvent = bind(this.handleEvent, this);
      this.handleEvent();
    }

    Modal.prototype.handleEvent = function() {
      return (function($) {
        $.fn.modal_success = function() {
          this.modal('hide');
          this.modal = new Utility.Masonry('.box', '#movies');
          this.modal.refresh();
        };
        $.fn.render_form_errors = function(errors) {
          var $form, model;
          $form = this;
          this.clear_previous_errors();
          model = this.data('model');
          $.each(errors, function(field, messages) {
            var $help_block, $input;
            $input = $('[name="' + model + '[' + field + ']"]');
            $help_block = $input.closest('.form-group').addClass('has-error').find('.help-block').html(messages.join(' & '));
          });
        };
        $.fn.clear_previous_errors = function() {
          $('.form-group.has-error', this).each(function() {
            $('.help-block', $(this)).html('');
            $(this).removeClass('has-error');
          });
        };
      })(jQuery);
    };

    return Modal;

  })();

}).call(this);
(function() {
  window.App || (window.App = {});

  App.Base = (function() {
    function Base() {
      if (window.jQuery) {
        this.setClearEventHandlers();
      }
      this.setUtilityConfirmation();
      this.setElementToast();
      this.setUtilityModal();
      this.setFormEventHandlers();
      new Element.Toast;
      return this;
    }


    /*
    Run the new action for the create action.  Generally the create action will 'render :new' if there was a problem.
    This prevents doubling the code for each action.
     */

    Base.prototype.create = function() {
      if (typeof $this["new"] === 'function') {
        return $this["new"]();
      }
    };


    /*
    Run the edit action for the update action.  Generally the update action will 'render :edit' if there was a problem.
    This prevents doubling the code for each action.
     */

    Base.prototype.update = function() {
      if (typeof $this.edit === 'function') {
        return $this.edit();
      }
    };


    /*
    Clear event handlers with a blank namespace.  This will prevent window and document event handlers from stacking
    when each new page is fetched.  Adding a namespace to your events will prevent them from being removed between page
    loads, i.e. "$(window).on 'scroll.app', myHandler"
     */

    Base.prototype.setClearEventHandlers = function() {
      return jQuery(document).on('page:before-change', function() {
        var element, event, handler, handlers, i, len, ref, results;
        ref = [window, document];
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          element = ref[i];
          results.push((function() {
            var ref1, results1;
            ref1 = jQuery._data(element, 'events') || {};
            results1 = [];
            for (event in ref1) {
              handlers = ref1[event];
              results1.push((function() {
                var j, len1, results2;
                results2 = [];
                for (j = 0, len1 = handlers.length; j < len1; j++) {
                  handler = handlers[j];
                  if ((handler != null) && handler.namespace === '') {
                    results2.push(jQuery(element).off(event, handler.handler));
                  } else {
                    results2.push(void 0);
                  }
                }
                return results2;
              })());
            }
            return results1;
          })());
        }
        return results;
      });
    };

    Base.prototype.setLinkEventHandlers = function() {
      return $('a[data-remote=true]').bind('ajax:complete', function(event, xhr, status) {
        var action, app, controller;
        controller = $(this).data().controller;
        action = $(this).data().action;
        app = eval("new App." + controller + "()");
        app.setResponse(xhr);
        eval("app." + action + "()");
        return this;
      });
    };

    Base.prototype.setFormEventHandlers = function() {
      return $(document).bind('ajax:error', 'form#new_movie', function(event, xhr, status, error) {
        console.log('error');
        $(event.data).render_form_errors($.parseJSON(xhr.responseText));
      }).on('ajax:success', 'form#new_movie', function(event, data, status, xhr) {
        console.log('sucess');
      });
    };

    Base.prototype.setUtilityConfirmation = function() {
      return new Utility.Confirmation();
    };

    Base.prototype.setElementToast = function() {
      return new Element.Toast();
    };

    Base.prototype.setUtilityModal = function() {
      return new Utility.Modal();
    };

    return Base;

  })();

}).call(this);
(function() {
  var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  window.App || (window.App = {});

  App.Movies = (function(superClass) {
    extend(Movies, superClass);

    function Movies() {
      this.test = bind(this.test, this);
      this.setResponse = bind(this.setResponse, this);
      this.edit = bind(this.edit, this);
      this["new"] = bind(this["new"], this);
      this.show = bind(this.show, this);
      this.index = bind(this.index, this);
      this.afterAction = bind(this.afterAction, this);
      this.beforeAction = bind(this.beforeAction, this);
      return Movies.__super__.constructor.apply(this, arguments);
    }

    Movies.prototype.beforeAction = function(action) {
      console.log("before " + action + " action");
    };

    Movies.prototype.afterAction = function(action) {
      console.log("after " + action + " action");
    };

    Movies.prototype.index = function() {
      console.log("index");
      new Utility.Masonry('.box', '#movies');
    };

    Movies.prototype.show = function() {
      console.log("show");
      new Element.Toolbar('#editmenu', '#user-options');
    };

    Movies.prototype["new"] = function() {
      console.log("new");
    };

    Movies.prototype.edit = function() {
      console.log("edit");
    };

    Movies.prototype.setResponse = function(resp) {
      this.resp = resp;
    };

    Movies.prototype.test = function() {};

    return Movies;

  })(App.Base);

}).call(this);






