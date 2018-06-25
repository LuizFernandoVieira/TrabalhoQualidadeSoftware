# Classe que representa os exemplares de livros
# que os usuários podem armazenar em suas estantes. 
class Book < ApplicationRecord
  belongs_to :shelf
  has_many :reviews
end
