# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  setInterval () ->
    $.ajax
      type: 'GET'
      url: '/'
      dataType: "script"
  , 15 * 1000

$(document).on 'turbolinks:load', ->
  $("#select_status").on 'change', ->
    $.ajax
      type: 'GET'
      url: '/'
      data: {
        'status_id': $('input[name=status]:checked').val()
      }
      dataType: "script"