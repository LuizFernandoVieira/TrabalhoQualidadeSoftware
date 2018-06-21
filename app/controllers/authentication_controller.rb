class AuthenticationController < ApplicationController
  layout 'authentication'
  skip_before_action :verify_authenticity_token

  def authentication
  end

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

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def register

  end

  def new_user
    @user = User.create(user_params.merge(shelf: Shelf.new))

    unless @user.save
      redirect_to '/no_access'
    end

    redirect_to '/'
  end

  def no_access
    sweetalert_error("Você precisa estar autenticado para acessar essa tela", "Erro", opts = {})
  end

  private

  def user_params
    params.permit(:name, :nickname, :phone_number, :password)
  end
end
