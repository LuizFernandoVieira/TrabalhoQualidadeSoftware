# Classe responsável pelas regras de negócio relacionadas à entidade
# livro. Agrupa funcinoalidades que o administrador possui sobre
# todos os livros cadastrados no sistema.
class Admin::BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # Recupera todos os livros cadastrados no sistema e
  # passa esses livros para a tela de listagem livros
  def index
    @books = Book.all
  end

  # Recupera um livro específico e passa esse livro
  # para a tela de detalhar livro
  def show
  end

  # Cria um novo livro e passa para a tela de
  # adicionar novo livro
  def new
    @book = Book.new
  end

  # Recupera um livro específico passa para a tela de
  # editar livro recuperado
  def edit
  end

  # Cria um livro baseado nos parâmetros recebidos e
  # adiciona esse livro no banco de dados. Caso algum erro
  # seja detectado durante essa etapa será mostrada uma mensagem
  # de erro na tela
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # Edita um livro recuperado do banco de dados atualizando seus
  # atributos de acordo com os valores recebidos como parâmetro.
  # Caso algum problema seja detectado durante essa etapa será mostrada
  # uma mensagem de erro na tela
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deleta um livro específico do banco de dados e retorna uma
  # mensagem de sucesso ou erro na operação de deleção
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :publication, :code)
  end
end
