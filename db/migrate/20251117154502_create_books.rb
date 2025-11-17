class CreateBooks < ActiveRecord::Migration[8.1]
def change
    create_table :books do |t|
      t.string :title
      t.string :publisher
      t.string :publish_year
      t.float :weight
      t.string :product_code
      t.string :supplier
      t.string :author
      t.string :language
      t.integer :page_count
      t.string :translator
      t.string :size
      t.string :format
      t.string :age
      t.text :description
      t.integer :qty_in_stock
      t.float :price

      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
