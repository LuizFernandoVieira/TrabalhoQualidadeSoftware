# Classe que representa os exemplares de livros
# que os usuários podem armazenar em suas estantes. 
class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :code, presence: true
  validates :shelf_id, presence: true

  belongs_to :shelf
  has_many :reviews
end
