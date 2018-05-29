class ApplicationController < ActionController::Base
  before_action :authorize_user, except: [:authentication, :login, :register, :new_user, :no_access]

  def index
  end

  protected
    def authorize_user
      logged = User.where(id: session[:user_id]).count > 0
      redirect_to '/no_access' unless logged
    end

end
