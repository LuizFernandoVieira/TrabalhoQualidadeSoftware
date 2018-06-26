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

  has_one :shelf
end
