class Ingredient < ActiveRecord::Base
  has_many :dish_ingredients, dependent: :destroy
  has_many :dishes, through: :dish_ingredients, inverse_of: :ingredient
  validates :short_descr, presence: true
end
