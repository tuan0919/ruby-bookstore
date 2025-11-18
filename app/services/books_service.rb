class BooksService
  private_class_method def self.to_dto(book)
          BookCardDto.new(
            bookId: book.id,
            title: book.title,
            price: book.price,
            discountedPrice: book.price * 0.9, # Giả định logic giảm giá
            discountPercentage: 10,
            imageUrl: book.images.find_by(is_thumbnail: true)&.url
          )
  end

  # Get top 5 book, sort by name
  def self.find_top_weekly_books(page: 1, per_page: 6, context: nil)
    query = Book.all.includes(:images).order(:title)
    paginated_books = query.page(page).per(per_page)
    data = paginated_books.map { |book|
      BookDetailsDto.new(
        bookId: book.id,
        title: book.title,
        publishYear: book.publish_year,
        publisher: book.publisher,
        weight: book.weight,
        productCode: book.product_code,
        supplier: book.supplier,
        author: book.author,
        language: book.language,
        pageCount: book.page_count,
        translator: book.translator,
        size: book.size,
        format: book.format,
        age: book.age,
        description: book.description,
        qtyInStock: book.qty_in_stock,
        price: book.price,
        discountedPrice: book.price * 0.9, # Giả định logic giảm giá
        imageUrls: book.images.map(&:url),
        reviews: [] # Giả định chưa có đánh giá nào
      )
    }
    page_response = PageResponse.new(
      content: data,
      last: paginated_books.last_page?,
      totalElements: paginated_books.total_count,
      totalPages: paginated_books.total_pages,
      size: paginated_books.limit_value,
      number: paginated_books.current_page,
      first: paginated_books.first_page?,
      numberOfElements: paginated_books.size,
      empty: paginated_books.empty?
    )

    page_response
  end

  def self.find_book_by_id(id)
      book = Book.find_by(id: id)
      unless book
        raise ApplicationException.new(ErrorCodes::BOOK_NOT_FOUND)
      end
      to_dto(book)
  end

  def self.list_all_books(page: 1, per_page: 20)
      books = Book.all
      paginated_books = books.page(page).per(per_page)
      book_dtos = paginated_books.map { |book| to_dto(book) }
      PageResponse.new(
        content: book_dtos,
        last: paginated_books.last_page?,
        totalElements: paginated_books.total_count,
        totalPages: paginated_books.total_pages,
        size: paginated_books.limit_value,
        number: paginated_books.current_page,
        first: paginated_books.first_page?,
        numberOfElements: paginated_books.size,
        empty: paginated_books.empty?
      )
  end

  def self.find_book_details_by_id(bookId)
    book = Book.includes(:category, :images).where(id: bookId).first
    dto = BookDetailsDto.new(
      bookId: book.id,
      title: book.title,
      publishYear: book.publish_year,
      publisher: book.publisher,
      weight: book.weight,
      productCode: book.product_code,
      supplier: book.supplier,
      author: book.author,
      language: book.language,
      pageCount: book.page_count,
      translator: book.translator,
      size: book.size,
      format: book.format,
      age: book.age,
      description: book.description,
      qtyInStock: book.qty_in_stock,
      price: book.price,
      discountedPrice: book.price * 0.9, # Giả định logic giảm giá
      imageUrls: book.images.map(&:url),
      reviews: [] # Giả định chưa có đánh giá nào
    )
    dto
  end

  def self.list_book_cards(page: 1, per_page: 20, context: nil)
    query = Book.all
    paginated_books = query.page(page).per(per_page)

    content_dtos = paginated_books.map do |book|
      BookCardDto.new(
        bookId: book.id,
        title: book.title,
        price: book.price,
        discountedPrice: book.price * 0.9, # Giả định logic giảm giá
        discountPercentage: 10,
        imageUrl: book.images.find_by(is_thumbnail: true)&.url
      )
    end

    page_response = PageResponse.new(
      content: content_dtos,
      last: paginated_books.last_page?,
      totalElements: paginated_books.total_count,
      totalPages: paginated_books.total_pages,
      size: paginated_books.limit_value,
      number: paginated_books.current_page,
      first: paginated_books.first_page?,
      numberOfElements: paginated_books.size,
      empty: paginated_books.empty?
    )

    page_response
  end

  def self.search_books(context:, category_id:, page: 1, per_page: 20)
    books = Book.all
    if category_id.present?
      books = books.where(category_id: category_id)
    end
    if context.present?
      search_term = "%#{context.strip}%"
      books = books.where(
        "LOWER(title) LIKE LOWER(:search) OR LOWER(author) LIKE LOWER(:search)",
        search: search_term
      )
    end
    paginated_books = books.page(page).per(per_page)
    book_dtos = paginated_books.map { |book| to_dto(book) }
    PageResponse.new(
      content: book_dtos,
      last: paginated_books.last_page?,
      totalElements: paginated_books.total_count,
      totalPages: paginated_books.total_pages,
      size: paginated_books.limit_value,
      number: paginated_books.current_page,
      first: paginated_books.first_page?,
      numberOfElements: paginated_books.size,
      empty: paginated_books.empty?
    )
    end
end
