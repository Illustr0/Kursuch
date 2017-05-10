class Category < ActiveRecord::Base
  belongs_to :category_tree, class_name: "Category", foreign_key: "category_tree_id",
   inverse_of: :category_tree
  has_many :children, class_name: "Category", foreign_key: "category_tree_id"
  has_many :dishes, inverse_of: :category
  
  validates :name, presence: true
end

# class Employee < ApplicationRecord
#   has_many :subordinates, class_name: "Employee",
#                           foreign_key: "manager_id"
 
#   belongs_to :manager, class_name: "Employee"
# end

# class CreateEmployees < ActiveRecord::Migration[5.0]
#   def change
#     create_table :employees do |t|
#       t.references :manager, index: true
#       t.timestamps
#     end
#   end
# end
