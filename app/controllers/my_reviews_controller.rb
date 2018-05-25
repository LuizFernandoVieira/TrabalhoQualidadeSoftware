class MyReviewsController < ApplicationController

  def index

    # select rev
    # from reviews
    # join Book b
    # where rev.book.id in (
    #   select book_id
    #   form User u
    #   join Shelf s
    #   join Book b
    #   where u.id = session.id
    # )

    @reviews = Review.where(book: User.find(session[:user_id]).shelf.books)

  end

end
