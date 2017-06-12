class Dish < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :dish_ingredients, dependent: :destroy, inverse_of: :dish
  has_many :ingredients, through: :dish_ingredients

  accepts_nested_attributes_for :ingredients, allow_destroy: true
  accepts_nested_attributes_for :dish_ingredients, allow_destroy: true

  validates :name, presence: true
  validates :instruction, presence: true
  validates :category_id, presence: true


  def self.search(params)
    puts 'search'
    result = Dish.includes(:dish_ingredients => :ingredient).references(:ingredient)
    if params['name'].present?
      result = result.where(name: params['name'])
    end
    if params['ingredient'].present?
      result = result.where(ingredients: {short_descr: params['ingredient']})
    end
    if params['category'].present?
      result = result.where(category: params['category'])
    end
      # puts "params #{params}"
      # puts "#{params['time_cook']}"
      # params['time_cook'] =  Time.parse("#{params['time_cook(4i)']}:#{params['time_cook(5i)']}")
    # Dish.where(time_cook:  Time.parse("22:55") + Time.zone.utc_offset)
    if params['time_cook(4i)'].present? && params['time_cook(5i)'].present?
      # result = result.where(time_cook: Time.parse("#{params['time_cook(4i)']}:#{params['time_cook(5i)']}") + Time.zone.utc_offset)
      result = result.where("time_cook = ?", Time.parse("#{params['time_cook(4i)']}:#{params['time_cook(5i)']}") + Time.zone.utc_offset)
    end
    result.all
  end
end
