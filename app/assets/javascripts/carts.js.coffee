# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("#cart_details .edit_line_item #line_item_quantity").change -> 
    if $(this).val() > 0
      $(this).parent().submit()
    else
      $(this).val(1)

