# Classe que representa os usuários do sistema.
# Um usuário pode ter duas permissões no sistema.
# A permissão de 'administrador' garante acesso a todas
# as telas desenvolvidas e a permissão 'usuário' garante
# acesso apenas às funcionalidades relativas ao usuário
# logado.
class User < ApplicationRecord
  has_one :shelf
end
