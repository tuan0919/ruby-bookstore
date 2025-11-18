class CartDto
  attr_accessor :userId, :items, :lastModified

  def initialize(userId:, items: [], lastModified: nil)
    @userId = userId
    @items = items
    @lastModified = lastModified
  end
end
