class CartItemDto
  attr_accessor :productId, :quantity
  def initialize(productId:, quantity:)
    @productId = productId
    @quantity = quantity
  end
end
