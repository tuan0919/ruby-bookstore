class CategoryDto
  attr_accessor :category_id, :name, :children
  def initialize(category_id:, name:, children: [])
    @category_id = category_id
    @name = name
    @children = children
  end
end
