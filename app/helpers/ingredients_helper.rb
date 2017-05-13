module IngredientsHelper
  def ingredient_options()
    Ingredient.all.pluck('short_descr, id')
  end
end
