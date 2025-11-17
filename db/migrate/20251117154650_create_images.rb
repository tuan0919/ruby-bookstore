class CreateImages < ActiveRecord::Migration[8.1]
  def change
    create_table :images do |t|
      t.references :book, null: false, foreign_key: true
      t.string :url
      t.boolean :is_thumbnail, default: false

      t.timestamps
    end
  end
end
