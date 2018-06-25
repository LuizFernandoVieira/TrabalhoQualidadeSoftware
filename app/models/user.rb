class User < ApplicationRecord
  validates :name, presence: true
  validates :nickname, presence: true
  validates :password, presence: true

  has_one :shelf
end
