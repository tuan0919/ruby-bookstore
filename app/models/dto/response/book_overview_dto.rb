class BookOverviewDto
  attr_accessor :book_id, :thumbnail, :price, :quantity_in_stock, :title, :author, :publisher, :publish_year, :description

  def initialize(book_id:, thumbnail:, price:, quantity_in_stock:, title:, author:, publisher:, publish_year:, description:)
    @book_id = book_id
    @thumbnail = thumbnail
    @price = price
    @quantity_in_stock = quantity_in_stock
    @title = title
    @author = author
    @publisher = publisher
    @publish_year = publish_year
    @description = description
  end

  def as_json(_options = {})
    {
      bookId: book_id,
      thumbnail: thumbnail,
      price: price,
      quantityInStock: quantity_in_stock,
      title: title,
      author: author,
      publisher: publisher,
      publishYear: publish_year,
      description: description
    }.compact
  end
end
