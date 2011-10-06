// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
  $("#query_question").watermark("Type your Query here...");
  $("#query_email").watermark("john@example.com");
	setTimeout(hideFlashMessages, 5000);
});

/*
$(function(){
	$('#query_email').click(function(){
		if($(this).val() == 'john@example.com'){
			$(this).val('');
			$(this).removeClass('query_eml');
		}
	});

	$('#query_question').click(function(){
		if($(this).val() == 'Enter your query here'){
			$(this).val('');
			$(this).removeClass('query_eml');
		}
	});

	$('#query_email').mouseout(function(){
		email_field_class($(this));
	});

	$('#query_question').mouseout(function(){
		question_field_class($(this));
	});

	$('#query_email').keyup(function(){
		email_field_class($(this));
	});

	$('#query_question').keyup(function(){
		question_field_class($(this));
	});


});

function email_field_class(obj){
	if (obj.val().length == 0) {
		obj.val('john@example.com');
		obj.addClass('query_eml');
	}
}

function question_field_class(obj){
	if (obj.val().length == 0) {
		obj.val('Enter your query here');
		obj.addClass('query_eml');
	}
}
*/


function hideFlashMessages(){
	$('div.notice, div.warning, div.error').fadeOut()
}
