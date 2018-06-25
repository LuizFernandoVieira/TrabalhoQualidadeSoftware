class Review < ApplicationRecord
  validates :description, presence: true
  validates :book_id, presence: true

  belongs_to :book
end
