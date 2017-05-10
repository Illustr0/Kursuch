class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.text :name, null: false
      t.time :time_cook
      t.text :instruction, null: false
      t.references :category, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end 
  end
end