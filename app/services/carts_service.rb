class CartsService
  def self.get_dummy_cart_by_user_id(user_id)
    CartDto.new(
      userId: user_id,
      items: [
        CartItemDto.new(productId: 1, quantity: 2),
        CartItemDto.new(productId: 3, quantity: 1)
      ]
    )
  end
end
