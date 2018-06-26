# Classe responsável pela consultra de livros baseado
# no filtro disponível para o usuário.
class ConsultBooksController < ApplicationController
  def index
    @books = Book.where(["title LIKE ?", "%#{params[:search]}%"])
  end
end
