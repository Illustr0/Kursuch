module IngredientsHelper
  def ingredient_options()
    arr = Ingredient.all.pluck('short_descr, id')
    # arr.each do |x|
    #   x[0] = x[0] + ' id:' +   x[1].to_s()
    # end
    arr
  end
end
