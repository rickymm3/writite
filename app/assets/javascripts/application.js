// This is a manifest file that'll be compiled into including all the files listed below.
// // Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// // be included in the compiled file accessible from http://example.com/assets/application.js
// // It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// // the compiled file.
// //
//= require jquery
//= require jquery.minicolors
//= require jquery.minicolors.simple_form
//= require jquery_ujs
//= require bootstrap-tokenfield
//= require twitter/bootstrap
//= require ckeditor-jquery
//= require jquery-ui/autocomplete
//= require_tree ./ckeditor
// //= require_tree .

$( document ).ready(function() {

    $('input.tokenize').tokenfield({
        autocomplete:{
            // This shows the min length of charcters that must be typed before the autocomplete looks for a match.
            minLength: 2,
            // This is the source of the auocomplete suggestions. In this case a list of names from the people controller, in JSON format.
            source: '<%= tag_list_path(:json) %>'
            // Once a value in the drop down list is selected, do the following:
        }
    });

    $('.ckeditor').ckeditor({
        // optional config
    });

});

