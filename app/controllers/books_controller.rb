class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = User.find(session[:user_id]).shelf.books
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

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
    @book.save
    respond_to do |format|
      format.html { redirect_to @book, notice: 'Book was successfully created.' }
      format.json { render :show, status: :created, location: @book }
    end
  end

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
      params.require(:book).permit(:title, :author, :publication, :code)
    end
end
