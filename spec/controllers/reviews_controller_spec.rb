require 'rails_helper'


RSpec.describe ReviewsController, type: :controller do
  before :all do
    @user = FactoryBot.create :user
    FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
  end

  describe 'index' do
    it 'should return all user reviews' do
      get :index, session: {'user_id': @user.id}
      FactoryBot.create(:review, book_id: @user.shelf.books.first.id)
      FactoryBot.create(:review, book_id: @user.shelf.books.last.id)
      expect(response).to have_http_status :success
      expect(assigns[:reviews].count).to eq @user.shelf.books.inject(0) { |sum, book| sum + book.reviews.count }
    end
  end

  describe 'create' do
    it 'should create a new review' do
      reviews_attributes = {description: 'Title', book_id: @user.shelf.books.first}
      expect {
        post :create, params: {review: reviews_attributes},
             session: {'user_id': @user.id}
      }.to change(Review, :count).by 1
    end
    it 'should not create a new review without book' do
      reviews_attributes = {description: 'Title'}
      expect {
        post :create, params: {review: reviews_attributes}, session: {'user_id': @user.id}
      }.to change(Review, :count).by 0
    end
  end

  describe 'update' do
    it 'should update a review' do
      review = FactoryBot.create :review, book: @user.shelf.books.first
      reviews_attributes = {description: 'livro top do top'}
      put :update, params: {id: review.id, review: reviews_attributes}, session: {'user_id': @user.id}
      expect(review.reload.description).to eq 'livro top do top'
    end
  end

  describe 'destroy' do
    it 'should delete a book' do
      review = FactoryBot.create :review, book: @user.shelf.books.first
      put :destroy, params: {id: review.id}, session: {'user_id': @user.id}
      expect(Review.exists? review.id).to be_falsey
    end
  end
end