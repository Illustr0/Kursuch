class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :dish_ingredients, dependent: :destroy, inverse_of: :dish
  has_many :ingredients, through: :dish_ingredients, inverse_of: :dish

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :dish_ingredients, allow_destroy: true

  validates :name, presence: true
  validates :instruction, presence: true
  validates :category_id, presence: true
end
