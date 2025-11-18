class CreateCategories < ActiveRecord::Migration[8.1]
  def up
    drop_table :categories, if_exists: true
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :parent_category, null: true, foreign_key: { to_table: :categories }
      t.timestamps
    end
  end

  def down
    drop_table :categories, if_exists: true
  end
end
