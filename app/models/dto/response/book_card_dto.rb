class BookCardDto
  attr_reader :bookId, :title, :price, :discountedPrice, :discountPercentage, :imageUrl

  def initialize(bookId:, title:, price:, discountedPrice:, discountPercentage:, imageUrl:)
    @bookId = bookId
    @title = title
    @price = price
    @discountedPrice = discountedPrice
    @discountPercentage = discountPercentage
    @imageUrl = imageUrl
  end
end
