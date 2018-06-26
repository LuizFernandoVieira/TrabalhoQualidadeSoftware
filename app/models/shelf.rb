# Classe que representa as estantes que armazenam até 10
# exemplares de livros. Cada usuário possui apenas uma estante.
class Shelf < ApplicationRecord
  validates :user_id, presence: true

  has_many :books
  belongs_to :user
end
