# Classe responsável por mostrar a home page.
class HomeController < ApplicationController

  # Apresenta a home page caso o usuário esteja logado
  def index
    @admin = User.find(session[:user_id]).name == 'admin'
    session[:admin] = @admin
  end
end
