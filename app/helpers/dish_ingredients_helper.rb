module DishIngredientsHelper
  def link_to_add_ingredient(form, ingredient)
    # Создаём новый объект. Аналог build в ранних примерах
    new_object = DishIngredient.new()
    # Нам нужна nested-форма. В момент создания ссылки её ещё нет. Создадим её
    # Все role_users в форме имеют свой номер 
    # Мы его пока заменям на фразу new_ru
    fields = form.fields_for(:dish_ingredients, new_object, 
      :child_index => 'new_di') do |di|
      render('dishes/one_dish_ingredient_form', di: di, i: 'Новый')
    end
    # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
    link_to(?#, class: 'btn btn-info', 
        id: 'add_ingredient_link', data: {content: "#{fields}"}) do 
      fa_icon("plus") + " Добавить ингредиент" 
    end
  end

  
  def link_to_remove_ingredient(form)  
    # При удалении nested-конструкции. Она реально не удаляется
    # Соответствующий html-блок скрывается
    # При этом выставляется значение специального поля _destroy
    # По этому поля rails понимает, что связь надо удалить
    form.hidden_field(:_destroy, class: 'remove_fields') + 
        # Ссылка будет обрабатываться javascript-ом поэтому адрес фиктивный
        link_to(?#, class: 'remove_fields remove_ingredient') do 
      fa_icon('times', title: 'Удалить ингредиент') + ' Удалить'      
    end
  end

  def link_to_edit_ingredient()
    link_to(?#, class: 'show_for_choose edit_ingredient', 
        id: 'edit_ingredient_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('edit', title: 'Редактировать ингредиент') + ' Править'
    end 
  end

  def link_to_new_ingredient()
    link_to(?#, class: 'show_for_edit', 
        id: 'new_ingredient_link', "data-content" => "#{link_to_cancel_edit()}") do 
      fa_icon('plus', title: 'Создать ингредиент') + ' Новый'
    end 
  end

  def link_to_cancel_edit()
    link_to(?#, class: 'cancel_edit',
        id: 'cancel_edit_link') do 
      fa_icon('ban', title: 'Отменить') + ' Отменить'
    end 
  end

  def link_to_destroy_ingredient()
    link_to(?#, class: 'show_for_choose destroy_ingredient',
        id: 'destroy_ingredient_link') do 
      fa_icon('trash', title: 'Уничтожить ингредиент') + ' Удалить ингредиент из всех блюд'
    end 
  end

end
