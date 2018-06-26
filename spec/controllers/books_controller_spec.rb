require 'rails_helper'


RSpec.describe BooksController, type: :controller do
  before :all do
    @user = FactoryBot.create :user
  end

  describe 'index' do
    it 'should return all user books' do
      FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
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
end