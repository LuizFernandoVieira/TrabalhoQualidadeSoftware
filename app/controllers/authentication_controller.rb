# Classe responsável pelas regras de negócio relacionadas ao login,
# logout, autenticação e funcionalidades relacionadas.
class AuthenticationController < ApplicationController
  layout 'authentication'
  skip_before_action :verify_authenticity_token

  # Redireciona para a tela de autenticação
  def authentication
  end

  # Verifica se o usuário que está tentando acessar o sistema
  # possui um login válido. Caso ele possua será redirecionado
  # para a home page e caso não possua uma mensagem de erro
  # no login será apresentada
  def login
    @user = User.where(nickname: params[:nickname], password: params[:password]).first
    session[:user_id] = @user&.id
    if @user
      redirect_to '/home'
    else
      sweetalert_error("Nome ou senha incorretos", "Erro", opts = {})
      redirect_to '/'
    end
  end

  # Realiza o logout do usuário que acessou a funcionalidade
  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  # Redireciona para a tela de registro da um novo usuário
  def register
  end

  # Cria um novo usuário baseado nos parâmetros que recuperou
  # e  adiciona esse usuário no banco de dados.
  def new_user
    @user = User.create(user_params.merge(shelf: Shelf.new))

    unless @user.save
      redirect_to '/no_access'
    end

    redirect_to '/'
  end

  # Apresenta mensagem de erro para o usuáiro que tentou
  # acessar uma tela sem ter logado anteriormente
  def no_access
    sweetalert_error("Você precisa estar autenticado para acessar essa tela", "Erro", opts = {})
  end

  private

  def user_params
    params.permit(:name, :nickname, :phone_number, :password)
  end
end
