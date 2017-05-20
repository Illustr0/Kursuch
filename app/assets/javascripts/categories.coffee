# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@hide_one_subcat=(link) ->
  link.parent().find('.show-list').hide()
  link.parent().find('.show-link').show()
  #alert("smt")
  false

@hide_all_subcat = ->
  $('a.hide-link').on 'click', ->
    window.hide_one_subcat($(this))
    false
  false

@show_one_subcat=(link) ->
  link.parent().find('.show-list').show()
  link.hide()
  #alert("smt")
  false

@show_all_subcat = ->
  $('a.show-link').on 'click', ->
    window.show_one_subcat($(this))
    false
  false

@hide_lists= ->
  $('.show-list').hide()
  false

# Запуск всего вышеописанного
category_ready = ->
  window.hide_lists()
  window.show_all_subcat()
  window.hide_all_subcat()


$(document).on 'page:load', category_ready # Включаем при ajax обновлении страницы
$(document).ready category_ready # Включаем при обычном обновлении страницы
