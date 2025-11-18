# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'json'

JSON_FILES = [
  Rails.root.join('db', 'ArtAnime.json'),
  Rails.root.join('db', 'LightNovelJP.json'),
  Rails.root.join('db', 'MangaJP.json'),
  Rails.root.join('db', 'MangaVN.json'),
  Rails.root.join('db', 'LightNovelVN.json')
].freeze

STATIC_CATEGORIES = [
  "All category",
  "Sách Tiếng Việt",
  "Sách ngoại văn",
  "Light Novel",
  "Manga",
  "Art, Anime Character"
]

def seed_book_record(book_data)
  # Chuyển tất cả các key JSON sang định dạng snake_case
  images = book_data['images']

  ActiveRecord::Base.transaction do
    category_record = Category.find_or_create_by!(name: book_data['category'])
    book_record = Book.find_or_create_by!(product_code: book_data['productCode']) do |b|
      b.title = book_data['title']
      b.author = book_data['author']
      b.publisher = book_data['publisher']
      b.publish_year = book_data['publishYear']
      b.weight = book_data['weight']
      b.supplier = book_data['supplier']
      b.language = book_data['language']
      b.page_count = book_data['pageCount']
      b.translator = book_data['translator']
      b.size = book_data['size']
      b.format = book_data['format']
      b.age = book_data['age']
      b.description = book_data['description']
      b.qty_in_stock = book_data['qtyInStock']
      b.price = book_data['price']
      b.category = category_record
    end

    images&.each_with_index do |url, index|
      Image.find_or_create_by!(
        book: book_record,
        url: url
      ) do |img|
        img.is_thumbnail = (index == 0)
      end
    end
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Lỗi khi tạo/cập nhật sách #{book_data['productCode']}: #{e.message}"
rescue StandardError => e
  puts "Lỗi không xác định khi xử lý sách #{book_data['productCode']}: #{e.message}"
end

def seed_from_json_file(file_path)
  unless File.exist?(file_path)
    puts "Tệp tin không tồn tại: #{file_path}"
    return
  end

  puts "--- Bắt đầu xử lý file: #{File.basename(file_path)} ---"
  file = File.read(file_path)

  data = JSON.parse(file)

  data.each do |item|
    seed_book_record(item['Books'])
  end
  puts "--- Kết thúc xử lý file: #{File.basename(file_path)} ---"
end

STATIC_CATEGORIES.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end
puts "✅ Đã tạo/cập nhật #{Category.count} danh mục cố định."

# 2. Xử lý tất cả các file trong danh sách
JSON_FILES.each do |file_path|
  seed_from_json_file(file_path)
end

puts "🎉 Hoàn tất quá trình Seed. Tổng số sách hiện có: #{Book.count}"
