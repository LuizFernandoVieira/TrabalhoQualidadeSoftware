# Classe que representa as estantes que armazenam até 10
# exemplares de livros. Cada usuário possui apenas uma estante.
class Shelf < ApplicationRecord
  has_many :books
  belongs_to :user
end
