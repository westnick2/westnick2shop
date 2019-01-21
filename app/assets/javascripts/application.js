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
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs
//= require easy-autocomplete
//= require trix
// require rails-ujs
//= require activestorage
// require turbolinks
//= require_tree .

/* header - sticker */
$(window).scroll(function(){
    var sticky = $('.sticky'),
        scroll = $(window).scrollTop();

    if (scroll >= 100) sticky.addClass('fixed');
    else sticky.removeClass('fixed');
});
/* header-links-greener */
$(document).ready(function () {
    $(location).attr('pathname');
    $('.link').each(function () {
        let l = $(this).attr('href');
        if(l === location.pathname){
            $(this).toggleClass('text-success');
        }
    })
});
/* autocomplete */
$(document).ready(function () {
    let options = {
        url: 'http://0.0.0.0:3000/search/auto_title.json', /* not correct */
        getValue: "title",
        list: {
            match: {
                enabled: true
            }
        }
    };
    $('#searchField').easyAutocomplete(options);
});
/* search */
$(document).ready(function () {
    $('#search').on('submit', function (event) {
        event.preventDefault();
        $('#root').replaceWith($('#results').css('display', 'block'));
        $('#searchButton').css('display', 'none');
    });
});
/* mail builder */
$(document).ready(function(){
    let pt1 = 'my_js_shop';
    let pt2 = 'example.com';
    $('#mail').text( pt1 +'@' + pt2);
});
/* hide - show short-description */
$(document).ready(function () {
    $('[id=card]').hover(
        function () {
            $('#description').css('display', 'block');
        },
        function () {
            $('#description').css('display', 'none');
        }
    )
});
