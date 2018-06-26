# Classe responsável pelas regras de negócio relacionadas à entidade
# resenha. Agrupa funcinoalidades que o administrador possui sobre
# todas as resenhas cadastrados no sistema.
class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # Recupera todos as resenhas cadastrados no sistema e
  # passa essas resenhas para a tela de listagem resenhas
  def index
    @reviews = Review.all
  end

  # Recupera uma resenha específica e passa essa resenha
  # para a tela de detalhar livro
  def show
  end

  # Cria uma nova resenha e passa para a tela de
  # adicionar nova resenha
  def new
    @review = Review.new
  end

  # Recupeara uma resenha específico passa para a tela de
  # editar resenha recuperado
  def edit
  end

  # Cria uma resenha baseada nos parâmetros recebidos e
  # adiciona essa resenha no banco de dados. Caso algum erro
  # seja detectado durante essa etapa será mostrada uma mensagem
  # de erro na tela
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # Edita uma resenha recuperado do banco de dados atualizando seus
  # atributos de acordo com os valores recebidos como parâmetro.
  # Caso algum problema seja detectado durante essa etapa será mostrada
  # uma mensagem de erro na tela
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deleta uma resenha específica do banco de dados e retorna uma
  # mensagem de sucesso ou erro na operação de deleção
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:description)
  end
end
