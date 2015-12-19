// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .


$(document).on('page:fetch', function() {
  $(".sk-fading-circle").show();
});

$(document).on('page:change', function() {
  $(".sk-fading-circle").hide();
});
//
//
// $( document ).ready(function() {
//
//   // hide spinner
//   $(".sk-fading-circle").hide();
//
//
//   // show spinner on AJAX start
//   $(document).ajaxStart(function(){
//     $(".sk-fading-circle").show();
//   });
//
//   // hide spinner on AJAX stop
//   $(document).ajaxStop(function(){
//     $(".sk-fading-circle").delay(3000).hide(0);
//   });
//
// });
//

