# Classe responsável pelas regras de negócio relacionadas à todas
# as demais telas do sistema. Aqui são agrupadas regras de permissão
# de acesso baseado nas informações de login que o usuário precisa
# preencher
class ApplicationController < ActionController::Base
  before_action :authorize_user, except: [:authentication, :login, :register, :new_user, :no_access]

  protected

  # Verifica se o usuário que está tentando acessar qualquer
  # página do sistema está autenticado. Caso esteja redireciona para
  # a página requerida e caso não esteja redireciona para página
  # de 'no_access'
  def authorize_user
    logged = User.where(id: session[:user_id]).count > 0
    redirect_to '/no_access' unless logged
  end
end
