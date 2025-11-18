class CreateImages < ActiveRecord::Migration[8.1]
  def up
    drop_table :images, if_exists: true
    create_table :images do |t|
      t.references :book, null: false, foreign_key: true
      t.string :url
      t.boolean :is_thumbnail, default: false

      t.timestamps
    end
  end

  def down
    drop_table :images, if_exists: true
  end
end
