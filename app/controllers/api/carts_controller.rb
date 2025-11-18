class Api::CartsController < ApplicationController
    def index
        # Placeholder for future cart functionality
        cart_data = CartsService.get_dummy_cart_by_user_id(1)
        render json: AppResponse.new(result: cart_data).as_json
    end
end
