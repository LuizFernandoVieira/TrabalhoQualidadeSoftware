class ConsultBooksController < ApplicationController

  def index
      @books = Book.all
  end

end
