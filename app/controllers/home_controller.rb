class HomeController < ApplicationController
  def index
    @admin = User.find(session[:user_id]).name == 'admin'
    session[:admin] = @admin
  end
end
