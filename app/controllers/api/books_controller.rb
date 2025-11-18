class Api::BooksController < ApplicationController
    def index
        book_overview_dtos = BooksService.list_all_books
        render json: AppResponse.new(result: book_overview_dtos).as_json
    end

    def show
        book_dto = BooksService.find_book_details_by_id(params[:id])
        render json: AppResponse.new(result: book_dto).as_json
    end

    def top_weekly
        book_overview_dtos = BooksService.find_top_weekly_books
        render json: AppResponse.new(result: book_overview_dtos).as_json
    end

    def cards
      page_response = BooksService.list_book_cards(
        page: params[:page] || 1,
        per_page: params[:per_page] || 20,
        context: params[:context]
      )
      render json: AppResponse.new(result: page_response).as_json
    end

    def search
        context = params[:context]
        category_id = params[:categoryId]
        book_overview_dtos = BooksService.search_books(context: context, category_id: category_id)
        render json: AppResponse.new(result: book_overview_dtos).as_json
    end

    private

    def book_params
        params.require(:book).permit(:title, :publisher, :publish_year, :weight, :product_code, :supplier, :author, :language, :page_count, :translator, :size, :format, :age, :description, :qty_in_stock, :price, :category_id)
    end
end
