json.extract! dish_ingredient, :id, :dish_id, :ingredient_id, :how_many, :measure, :created_at, :updated_at
json.url dish_ingredient_url(dish_ingredient, format: :json)
