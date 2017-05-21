if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)

# Clear 
puts "destroy_all: start"
DishIngredient.destroy_all
Dish.destroy_all
Category.destroy_all
Ingredient.destroy_all
puts "destroy_all: done"

# Category
puts "Category: start"
c1 = Category.create(name: "Основная категория 1")
c2 = Category.create(name: "Основная категория 2")
c3 = Category.create(name: "Подкатегория 1", category_tree: c1)
puts "Category: done"

# Dish
puts "Dish: start"
d1 = Dish.create(name: "Блюдо 1", instruction: "Инструкция блюдо 1", 
	category: c1, time_cook: Time.now, user: u1)
d2 = Dish.create(name: "Блюдо 2", instruction: "Инструкция блюдо 2", 
	category: c2, time_cook: Time.now, user: u1)
d3 = Dish.create(name: "Блюдо 3", instruction: "Инструкция блюдо 3", 
	category: c3, time_cook: Time.now, user: u2)
puts "Dish: done"
# Ingredient
# DishIngredient
3.times do |i|
	ingr = Ingredient.create(short_descr: "Ингредиент #{i}")
	di = DishIngredient.create(dish: d1, ingredient: ingr, how_many: i, measure: "y.e")
	puts "DishIngredient #{i}: done"
end

3.times do |i| 
	ingr = Ingredient.create(short_descr: "Ингредиент #{i}#{i}")
	di = DishIngredient.create(dish: d2, ingredient: ingr,
		how_many: i, measure: "y.e")
end
