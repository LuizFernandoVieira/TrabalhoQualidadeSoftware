class ShelvesController < ApplicationController

  def show
    puts session[:user_id]
    @books = User.find(session[:user_id]).shelf.books
  end

end
