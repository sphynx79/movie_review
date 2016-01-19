(function(){window.App||(window.App={}),App.modalSuccess=function(t){return console.log("modal success"),t.modal("hide"),$("#movies").masonry({isFitWidth:!0,itemSelector:".box"}).imagesLoaded(function(){return $("#movies").masonry("reload")})},function(t){t.fn.modal_success=function(){this.modal("hide"),this.find('form input[type="text"]').val(""),this.clear_previous_errors()},t.fn.render_form_errors=function(n){var o,e;o=this,this.clear_previous_errors(),e=this.data("model"),t.each(n,function(n,o){var i,r;r=t('[name="'+e+"["+n+']"]'),i=r.closest(".form-group").addClass("has-error").find(".help-block").html(o.join(" & "))})},t.fn.clear_previous_errors=function(){t(".form-group.has-error",this).each(function(){t(".help-block",t(this)).html(""),t(this).removeClass("has-error")})}}(jQuery)}).call(this),function(){window.Element||(window.Element={}),Element.Confirmation=function(){function t(){return $.rails.allowAction=function(t){return t.attr("data-confirm")?($.rails.showConfirmDialog(t),!1):!0},$.rails.confirmed=function(t){return t.removeAttr("data-confirm"),t.trigger("click.rails")},$.rails.showConfirmDialog=function(t){var n,o;return o=t.attr("data-confirm"),n=bootbox.confirm(o,function(n){return n?$.rails.confirmed(t):void 0})},this}return t}()}.call(this),function(){window.Element||(window.Element={}),Element.Toast=function(){function t(){return $.toast.options={text:"",heading:"",showHideTransition:"fade",allowToastClose:!0,hideAfter:4e3,stack:5,position:{right:16,top:1},bgColor:!1,textColor:!1,textAlign:"left",icon:!1,beforeShow:function(){},afterShown:function(){},beforeHide:function(){},afterHidden:function(){}},this}return t}()}.call(this),function(){var t=function(t,n){return function(){return t.apply(n,arguments)}};window.Element||(window.Element={}),Element.Toolbar=function(){function n(n,o){return this.setting=t(this.setting,this),this.element=n,this.option=o,this.setting(),this}return n.prototype.setting=function(){return this.element.toolbar({content:this.option,position:"bottom",event:"click",hideOnClick:!0})},n}()}.call(this),function(){window.Utility||(window.Utility={}),Utility.Masonry=function(){function t(t,n){return t.hide(),n.imagesLoaded(function(){return t.fadeIn(),n.masonry({itemSelector:".box",isFitWidth:!0,isAnimated:!Modernizr.csstransitions})}),this}return t}()}.call(this),function(){window.App||(window.App={}),App.Base=function(){function Base(){return window.jQuery&&this.setClearEventHandlers(),this.setFormEventHandlers(),new Element.Toast,this}return Base.prototype.create=function(){return"function"==typeof $this["new"]?$this["new"]():void 0},Base.prototype.update=function(){return"function"==typeof $this.edit?$this.edit():void 0},Base.prototype.setClearEventHandlers=function(){return jQuery(document).on("page:before-change",function(){var t,n,o,e,i,r,s,a;for(s=[window,document],a=[],i=0,r=s.length;r>i;i++)t=s[i],a.push(function(){var i,r;i=jQuery._data(t,"events")||{},r=[];for(n in i)e=i[n],r.push(function(){var i,r,s;for(s=[],i=0,r=e.length;r>i;i++)o=e[i],null!=o&&""===o.namespace?s.push(jQuery(t).off(n,o.handler)):s.push(void 0);return s}());return r}());return a})},Base.prototype.setLinkEventHandlers=function(){return $("a[data-remote=true]").bind("ajax:complete",function(event,xhr,status){var action,app,controller;return controller=$(this).data().controller,action=$(this).data().action,app=eval("new App."+controller+"()"),app.setResponse(xhr),eval("app."+action+"()"),this})},Base.prototype.setFormEventHandlers=function(){return $(document).bind("ajax:error","form#new_movie",function(t,n,o,e){console.log("error"),$(t.data).render_form_errors($.parseJSON(n.responseText))}).on("ajax:success","form#new_movie",function(t,n,o,e){console.log("sucess")})},Base}()}.call(this),function(){var t=function(t,n){return function(){return t.apply(n,arguments)}},n=function(t,n){function e(){this.constructor=t}for(var i in n)o.call(n,i)&&(t[i]=n[i]);return e.prototype=n.prototype,t.prototype=new e,t.__super__=n.prototype,t},o={}.hasOwnProperty;window.App||(window.App={}),App.Movies=function(o){function e(){return this.test=t(this.test,this),this.setResponse=t(this.setResponse,this),this.edit=t(this.edit,this),this["new"]=t(this["new"],this),this.show=t(this.show,this),this.index=t(this.index,this),this.afterAction=t(this.afterAction,this),this.beforeAction=t(this.beforeAction,this),e.__super__.constructor.apply(this,arguments)}return n(e,o),e.prototype.beforeAction=function(t){console.log("before "+t+" action")},e.prototype.afterAction=function(t){console.log("after "+t+" action")},e.prototype.index=function(){console.log("index"),new Utility.Masonry($(".box"),$("#movies"))},e.prototype.show=function(){console.log("show"),new Element.Confirmation,new Element.Toolbar($("#editmenu"),"#user-options")},e.prototype["new"]=function(){console.log("show"),$("#modal-window").html(this.resp.responseText),$("#modal-window").modal("show")},e.prototype.edit=function(){console.log("edit")},e.prototype.setResponse=function(t){this.resp=t},e.prototype.test=function(){$("#modal-window").html(this.resp.responseText),$("#modal-window").modal("show")},e}(App.Base)}.call(this);