// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require materialize
//= require sweetalert2
//= require sweet-alert2-rails

$(function() {
  var teste = $(".dropdown-trigger");
  console.log(teste);

  $(".dropdown-trigger").dropdown({
     inDuration: 300,
     outDuration: 225,
     constrain_width: true,
     hover: false,
     gutter: 0,
     belowOrigin: false
  });
});
