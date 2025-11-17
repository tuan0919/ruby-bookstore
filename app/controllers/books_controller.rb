class BooksController < ApplicationController
    def index
        @books = Book.includes(:images).all
    end

    def show
        book_dto = BookOverviewDto.new(
            book_id: request.params[:id],
            thumbnail: 'http://example.com/thumbnail.jpg',
            price: 31.5,
            quantity_in_stock: 111,
            title: 'Test Book Title'
        )
        render json: AppResponse.new(result: book_dto).as_json
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book, notice: 'Book was successfully created.'
        else
            render :new
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :publisher, :publish_year, :weight, :product_code, :supplier, :author, :language, :page_count, :translator, :size, :format, :age, :description, :qty_in_stock, :price, :category_id)
    end
end