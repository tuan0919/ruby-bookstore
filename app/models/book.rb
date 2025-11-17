class Book < ApplicationRecord
    has_many :images, dependent: :destroy
    belongs_to :genre
    belongs_to :category
end
