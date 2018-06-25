# Classe que representa as resenhas que os usuários
# do sistema podem fazer a respeito de livros selecionados.
class Review < ApplicationRecord
  belongs_to :book
end
