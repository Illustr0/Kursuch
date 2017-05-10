class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.text :short_descr, :null => false

      t.timestamps null: false
    end
  end
end
