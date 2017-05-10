json.extract! dish, :id, :name, :time_cook, :instruction, :category_id, :created_at, :updated_at
json.url dish_url(dish, format: :json)
