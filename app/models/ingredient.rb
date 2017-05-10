class Ingredient < ActiveRecord::Base
  has_many :dishIngredients

  validates :short_descr, presence: true
end
