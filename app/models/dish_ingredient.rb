class DishIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :dish, inverse_of: :dish_ingredients

  validates :how_many, presence: true
  validates :measure, presence: true
end
