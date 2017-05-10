class DishIngredient < ActiveRecord::Base
  belongs_to :dish
  belongs_to :ingredient

  validates :how_many, presence: true
  validates :measure, presence: true
end
