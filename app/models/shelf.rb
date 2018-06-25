class Shelf < ApplicationRecord
  validates :user_id, presence: true

  has_many :books
  belongs_to :user
end
