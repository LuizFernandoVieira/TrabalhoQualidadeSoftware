# Classe que representa os usuários do sistema.
# Um usuário pode ter duas permissões no sistema.
# A permissão de 'administrador' garante acesso a todas
# as telas desenvolvidas e a permissão 'usuário' garante
# acesso apenas às funcionalidades relativas ao usuário
# logado.
class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :nickname, presence: true, length: { maximum: 5 }
  validates :password, presence: true, length: { maximum: 5 }
  validates :phone_number, length: { maximum: 11 }
  validate  :validate_name_chars, :validate_password

  has_one :shelf

  def validate_name_chars
    errors.add(:name, 'Deve deve conter apenas letras, espaço em braco ou ponto') if (name =~ /^[a-zA-Z. ]*$/) == nil
  end

  def validate_password
    errors.add(:password, 'Senha nao deve ter letras repetidas.') if password&.chars.to_a.uniq != password&.chars.to_a
  end
end
