class AuthenticationController < ApplicationController

  layout 'authentication'
  skip_before_action :verify_authenticity_token

  def authentication
  end

  def login
    @user = User.where(nickname: params[:nickname], password: params[:password]).first
    session[:user_id] = @user&.id
    redirect_to '/home' if @user
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end

  def register

  end

  def new_user
    @user = User.new(user_params)
    @user.shelf = Shelf.create()

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
