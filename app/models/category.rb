class Category < ActiveRecord::Base
  # дерево категорий
  # category_tree для указания родительской категории, nil если основная
  # children => [] возвращает массив потомков (подкатегорий) каждой категории
  
  belongs_to :category_tree, class_name: "Category", foreign_key: "category_tree_id",
   inverse_of: :category_tree
  has_many :children, class_name: "Category", foreign_key: "category_tree_id", dependent: :destroy
  has_many :dishes, inverse_of: :category, dependent: :restrict_with_error
  
  validates :name, presence: true
end

