# Classe que representa os exemplares de livros
# que os usuários podem armazenar em suas estantes. 
class Book < ApplicationRecord
  enum genre: %i[ epopeia novela conto ensaio romance ]

  validates :title, presence: true, length: {maximum: 20}
  validates :author, presence: true
  validates :code, presence: true, length: {maximum: 5}, numericality: {only_integer: true}
  validates :shelf_id, presence: true
  validate :duplicated_whitespaces

  belongs_to :shelf
  has_many :reviews

  def duplicated_whitespaces
    errors.add(:title, 'Não pode have espaço em branco duplicado. ') if (title&.gsub('  ', ' ') != title)
  end
end
