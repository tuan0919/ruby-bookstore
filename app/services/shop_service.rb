class ShopService
  def self.get_shop_init_data
    categories = CategoriesService.list_all_categories
    ShopDataInitDto.new(categoryResponseDTOs: categories)
  end
end
