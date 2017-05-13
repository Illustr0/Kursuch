class Ingredient < ActiveRecord::Base
  has_many :dish_ingredients, inverse_of: :ingredient
  has_many :dishes, through: :dish_ingredients, inverse_of: :ingredient
  validates :short_descr, presence: true
end
