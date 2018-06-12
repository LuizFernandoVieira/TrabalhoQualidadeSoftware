class ConsultBooksController < ApplicationController
  def index
    @books = Book.where(["title LIKE ?", "%#{params[:search]}%"])
  end
end
