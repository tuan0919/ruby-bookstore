class BookOverviewDto
  attr_accessor :book_id, :thumbnail, :price, :quantity_in_stock, :title

  def initialize(book_id:, thumbnail:, price:, quantity_in_stock:, title:)
    @book_id = book_id
    @thumbnail = thumbnail
    @price = price
    @quantity_in_stock = quantity_in_stock
    @title = title
  end

  def as_json(_options = {})
    {
      bookId: book_id,
      thumbnail: thumbnail,
      price: price,
      quantityInStock: quantity_in_stock,
      title: title,
    }.compact
  end
end