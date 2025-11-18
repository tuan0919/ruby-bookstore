class CategoriesService
  def self.list_all_categories
    categories = Category.includes(:children).where(parent_category_id: nil)

    categories.map do |category|
      CategoryDto.new(
        category_id: category.id,
        name: category.name,
        children: category.children.map do |child|
          CategoryDto.new(
            category_id: child.id,
            name: child.name
          )
        end
      )
    end
  end
end
