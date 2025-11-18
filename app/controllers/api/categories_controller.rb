class Api::CategoriesController < ApplicationController
    def index
        category_dtos = CategoriesService.list_all_categories
        render json: AppResponse.new(result: category_dtos).as_json
    end
end
