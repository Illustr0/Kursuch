class DishIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :dish, inverse_of: :dish_ingredients

  # связь блюдо - ингредиент должно быть уникальным
  validates :dish_id, uniqueness: {scope: [:ingredient_id]}
  validates :how_many, presence: true 
  validates :measure, presence: true
  accepts_nested_attributes_for :ingredient, allow_destroy: true

  # если поля пустые - заполнить их
  before_validation :default_how_many, :default_measure

  private
    def default_how_many
      self.how_many ||= 1
    end

    def default_measure
      self.measure = "y.e." if self.measure.nil? or self.measure ==""
    end
end
