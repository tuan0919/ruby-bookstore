class BookDetailsDto
  attr_accessor :bookId, :title, :publishYear, :publisher, :weight, :productCode, :supplier, :author, :language, :pageCount, :translator, :size, :format, :age, :description, :qtyInStock, :price, :discountedPrice, :imageUrls, :reviews
  def initialize(bookId:, title:, publishYear:, publisher:, weight:, productCode:, supplier:, author:, language:, pageCount:, translator:, size:, format:, age:, description:, qtyInStock:, price:, discountedPrice:, imageUrls:, reviews: [])
    @bookId = bookId
    @title = title
    @publishYear = publishYear
    @publisher = publisher
    @weight = weight
    @productCode = productCode
    @supplier = supplier
    @author = author
    @language = language
    @pageCount = pageCount
    @translator = translator
    @size = size
    @format = format
    @age = age
    @description = description
    @qtyInStock = qtyInStock
    @price = price
    @discountedPrice = discountedPrice
    @imageUrls = imageUrls
    @reviews = reviews
  end
end
