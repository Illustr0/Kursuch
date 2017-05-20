module CategoriesHelper
  def main_category_options()
    Category.where(category_tree: nil).pluck('name, id')
  end
end
