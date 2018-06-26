# Classe responsável pelas regras de negócio relacionadas
# ao usuário logado
class UsersController < ApplicationController

  # Redireciona para a tela do usuário logado
  def index
  end

  # Recupera usuário cujo apelido é igual ao
  # apelido passado como parâmetro
  def consult_users
    @users = User.where(["nickname LIKE ?", "%#{params[:nickname]}%"])
  end
end
