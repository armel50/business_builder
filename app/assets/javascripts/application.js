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
//= require cable
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
document.addEventListener("DOMContentLoaded",function() {
  
    // fix menu when passed
    $('.masthead').visibility({
        once: false,
        onBottomPassed: function() {
          $('.fixed.menu').transition('fade in');
        },
        onBottomPassedReverse: function() {
          $('.fixed.menu').transition('fade out');
        }
      });

    // create sidebar and attach to menu open
    $('.ui.sidebar').sidebar('attach events', '.toc.item');

    $(".main.item").hover(function(){
      $(this).toggleClass("active");
    },function(){
      $(this).toggleClass("active");
    });

    $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade out');
  });

  var input = $("input#business_name1")
  var search =  $("input.prompt");
  var form = $("div#search_bar_form form")
  search.on("keypress", function(e){
      search.focus()
      if(e.which !== 13  ){   
    }else{
        input.val(search.val())
        form.submit()
      }
  });

  });