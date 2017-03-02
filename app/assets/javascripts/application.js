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
//= require jquery_ujs
//= require ckeditor/init
//= require_tree ./code
//= require moment
//= require bootstrap-datetimepicker

$(document).ready(function() {
    $(window).scroll(function(){
        if ($(this).scrollTop() > 600) {
            $(".scrollToTop").fadeIn(1000)
        } else {
            $(".scrollToTop").fadeOut(1000);
        }
    });

    //Click event to scroll to top
    $(".scrollToTop").click(function(){
        $('html, body').animate({scrollTop : 0},500);
        return false;
    });
});
