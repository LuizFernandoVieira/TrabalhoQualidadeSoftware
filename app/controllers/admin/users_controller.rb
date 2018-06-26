# Classe responsável pelas regras de negócio relacionadas à entidade
# usuário. Agrupa funcinoalidades que o administrador possui sobre
# todos os usuários cadastrados no sistema.
class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Recupera todos os usuários cadastrados no sistema e
  # passa esses usuários para a tela de listagem de usuários
  def index
    @users = User.all
  end

  # Recupera um usuário específico e passa esse usuário
  # para a tela de detalhar usuário
  def show
  end

  # Cria um novo usuário e passa para a tela de
  # adicionar novo usuário
  def new
    @user = User.new
  end

  # Recupear um usuário específico e passa para a tela de
  # editar usuário recuperado
  def edit
  end

  # Cria um usuário baseado nos parâmetros recebidos e
  # adiciona esse usuário no banco de dados. Caso algum erro
  # seja detectado durante essa etapa será mostrada uma mensagem
  # de erro na tela
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # Edita um usuário recuperado do banco de dados atualizando seus
  # atributos de acordo com os valores recebidos como parâmetro.
  # Caso algum problema seja detectado durante essa etapa será mostrada
  # uma mensagem de erro na tela
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # Deleta um usuário específico do banco de dados e retorna uma
  # mensagem de sucesso ou erro na operação de deleção
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :phone_number, :password)
  end
end
