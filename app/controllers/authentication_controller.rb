class AuthenticationController < ApplicationController

  layout 'authentication'
  skip_before_action :verify_authenticity_token

  def authentication

  end

  def login
    @user = User.where(nickname: params[:nickname], password: params[:password]).first
    session[:user_id] = @user.id
    if @user
      redirect_to '/books'
    end
  end

  def logout

  end

end
