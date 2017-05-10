class Dish < ActiveRecord::Base
  belongs_to :category
  has_many :dishIngredients
  has_many :ingredient, through: :dishIngredients

  validates :name, presence: true
  validates :instruction, presence: true
  validates :category_id, presence: true
end
