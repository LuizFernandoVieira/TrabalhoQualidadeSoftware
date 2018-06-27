# Classe responsável pelas regras de negócio relacionadas à entidade
# livro. Agrupa funcinoalidades que o usuário possui sobre
# todos os livros pertencentes à sua prateleira.
class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # Recupera os livros do usuário logado e passa os
  # livros recuperados para a tela de listagem dos livros
  # na estante do usuário logado
  def index
    @books = User.find(session[:user_id])&.shelf&.books
  end

  # Recupera um livro específico do usuário logado
  #  e passa essa livro para a tela de detalhar livro
  def show
  end

  # Cria um novo livro e passa para a tela de
  # adicionar novo livro
  def new
    @book = Book.new
  end

  # Recupeara um livro específico da estante do usuário
  # logado e passa para a tela de editar livro recuperado
  def edit
  end

  # Cria um livro baseado nos parâmetros recebidos e
  # adiciona esse livro na estante do usuário logado. Caso essa estante
  # já possua dez livros então o livro não será adicionado, pois a
  # quantidade máxima de livros que uma estante armazena foi atingida.
  # Nesse caso, uma mensagem de erro será mostrada para o usuário. Outro
  # caso que gera erro é a tentativa de adição de um livro que já está
  # na estante. Nesse caso, uma outra mensagem de erro será mostrada.
  def create
    @book = Book.new(book_params)

    books_count = User.find(session[:user_id]).shelf.books.length
    book_registered = Book.where(title: book_params[:title], author: book_params[:author]).count

    if books_count >= 10
      sweetalert_error("Essa estante já possuir a quantidade máxima de livros", "Erro", opts = {})
      return render "new"
    elsif book_registered > 0
      sweetalert_error("Esse livro já está na estante", "Erro", opts = {})
      return render "new"
    end

    @book.shelf = User.find(session[:user_id]).shelf


    return redirect_to @book, notice: 'Book was successfully created.' if @book.save
    render '/books/new'
  end

  # Edita um livro recuperado da estante do usuário logado atualizando
  # seus atributos de acordo com os valores recebidos como parâmetro.
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

  # Deleta um livro específico da estante do usuário logado
  # e retorna uma mensagem de sucesso ou erro na operação de deleção
  def destroy
    @book.reviews.destroy_all
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
    params.require(:book).permit(:title, :author, :publication, :code, :genre)
  end
end
