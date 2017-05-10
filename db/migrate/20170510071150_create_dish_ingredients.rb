class CreateDishIngredients < ActiveRecord::Migration
  def change
    create_table :dish_ingredients do |t|
      t.references :dish, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.integer :how_many, null: false
      t.text :measure, null: false

      t.timestamps null: false
    end
    add_index :dish_ingredients, [:dish_id, :ingredient_id], unique: true
  end
end
