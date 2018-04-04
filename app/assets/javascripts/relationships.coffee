# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('#donornameautocomplete').autocomplete
		source: $('#donornameautocomplete').data('autocomplete-source')


	$('#donorname').autocomplete
		source: $('#donorname').data('autocomplete-source')