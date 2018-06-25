# Classe que representa as resenhas que os usuários
# do sistema podem fazer a respeito de livros selecionados.
class Review < ApplicationRecord
  validates :description, presence: true
  validates :book_id, presence: true

  belongs_to :book
end
