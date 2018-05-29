class Book < ApplicationRecord
  belongs_to :shelf
  has_many :reviews
end
