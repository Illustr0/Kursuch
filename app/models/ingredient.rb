class Ingredient < ActiveRecord::Base
  has_many :dish_ingredients

  validates :short_descr, presence: true
end
