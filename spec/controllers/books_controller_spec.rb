require 'rails_helper'


RSpec.describe BooksController, type: :controller do
  before :all do
    @user = FactoryBot.create :user
    FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
  end

  describe 'index' do
    it 'should return all user books' do
      get :index, session: {'user_id': @user.id}
      expect(response).to have_http_status :success
      expect(assigns[:books].count).to eq 5
    end
  end

  describe 'create' do
    it 'should create a new book' do
      books_attributes = {title: 'Title', author: 'Author', code: '777', shelf_id: @user.shelf.id}
      expect {
        post :create, params: {book: books_attributes}, session: {'user_id': @user.id}
      }.to change(Book, :count).by 1
    end

    it 'should not create a new book with missing required params' do
      books_attributes = {title: 'Title 2'}
      expect {
        post :create, params: {book: books_attributes}, session: {'user_id': @user.id}
      }.to change(Book, :count).by 0
    end
  end

  describe 'update' do
    it 'should update a book' do
      book = @user.shelf.books.first
      books_attributes = {code: '7000'}
      put :update, params: {id: book.id, book: books_attributes}, session: {'user_id': @user.id}
      expect(book.reload.code).to eq '7000'
    end
  end

  describe 'destroy' do
    it 'should delete a book' do
      book = @user.shelf.books.first
      put :destroy, params: {id: book.id}, session: {'user_id': @user.id}
      expect(Book.exists? book.id).to be_falsey
    end
  end
end