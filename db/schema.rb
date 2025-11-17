# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_17_154650) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "age"
    t.string "author"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "format"
    t.string "language"
    t.integer "page_count"
    t.float "price"
    t.string "product_code"
    t.string "publish_year"
    t.string "publisher"
    t.integer "qty_in_stock"
    t.string "size"
    t.string "supplier"
    t.string "title"
    t.string "translator"
    t.datetime "updated_at", null: false
    t.float "weight"
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.bigint "parent_category_id"
    t.datetime "updated_at", null: false
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.boolean "is_thumbnail", default: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["book_id"], name: "index_images_on_book_id"
  end

  add_foreign_key "books", "categories"
  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "images", "books"
end
