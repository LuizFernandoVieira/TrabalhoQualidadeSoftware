class MyShelfController < ApplicationController

  def index
    @books = User.find(session[:user_id]).shelf.books
  end

end
