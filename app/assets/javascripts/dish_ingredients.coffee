@submit_test = (t) ->
  #a = t.attr("id")
  #if confirm(t.id)
    #t.form.submit()
    #t.form.submit()
  #  
  ingrDescr = $('#'+t.id + ' option:selected').text()
  alert(ingrDescr)
  ingrID = $('#'+t.id).val()
  frm = ('#' + t.id)
  panel = $(frm).parent().parent().parent().parent()
  #panel.find("input[type=hidden].ingr_id").val(ingrID)
  #panel.find("input[type=text].ingr_descr").val(ingrDescr)
  e = panel.find(".new_form")
  f = e.attr("data-content")
  e.html(f)

  false

# Удаление одного ингредиента
@del_one_di = (link)->
  if confirm("Вы уверены?")
    link.parent().find("input[type=hidden].remove_fields").first().val("1")
    link.parent().parent().parent().parent().hide()

# Включаем все кнопки удаления
@del_all_dis = ->
  $('a.remove_ingredient').on 'click', ->
    window.del_one_di($(this))
    false
  false

# Включаем кнопку добавления роли
@add_new_di = ->
  $('#add_ingredient_link').on 'click', ->
    # Подменяем временный id с фразой new_ru на случайной число
    new_id = new Date().getTime()
    regexp = new RegExp("new_ingredient", "g")
    content = $(this).attr('data-content')
    content = content.replace(regexp, new_id)
    # Вставляем на страницу
    $(this).parent().parent().after(content)
    panel = $(this).parent().parent().parent().find('.panel-info').first()
    # Если бы были даты с datepicker-ом 
    # window.datepicker_activation_by_item(panel)
    # Включаем у новой роли кнопку удаления
    # Её раньше не было, поэтому при зарузке страницы она не включалась
    panel.find('a.remove_ingredient').on 'click', ->
      window.del_one_di($(this))
      false    
    panel.find('.show_for_choose').hide()
    panel.find('.show_for_edit').hide()
    #panel.find('.show_for_choose').last().show()
    false

@edit_one_ingr = (link)->
  link.parent().parent().parent().find('.show_for_choose').hide()
  link.parent().parent().parent().find('.show_for_edit').show()
  #$('.show_for_edit').remove

@edit_all_ingr = ->
  $('a.show_for_choose').on 'click', ->
    window.edit_one_ingr($(this))
    false    
  false

@hide_edit_form = ->
  $('.show_for_edit').hide()
  false

@submit_link = ->
  $('a.save_ingredient_link').on 'click', ->
    false
  false

# Запуск всего вышеописанного
di_ready = ->
  window.add_new_di()
  window.del_all_dis()
  window.edit_all_ingr()
  window.hide_edit_form()
  window.submit_link()


$(document).on 'page:load', di_ready # Включаем при ajax обновлении страницы
$(document).ready di_ready # Включаем при обычном обновлении страницы


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
