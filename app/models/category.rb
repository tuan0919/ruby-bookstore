class Category < ApplicationRecord
    has_many :books
    has_many :children, class_name: "Category", foreign_key: "parent_category_id", dependent: :destroy
    belongs_to :parent, class_name: "Category", foreign_key: "parent_category_id", optional: true
end
