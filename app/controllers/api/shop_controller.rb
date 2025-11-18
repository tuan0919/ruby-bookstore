class Api::ShopController < ApplicationController
  def index
    shop_data_init_dto = ShopService.get_shop_init_data
    render json: AppResponse.new(result: shop_data_init_dto).as_json
  end
end
