require 'rails_helper'


RSpec.describe BooksController, type: :controller  do
  before :all do
    @user = FactoryBot.create :user
  end

  describe 'index' do
    it 'should return all user books' do
      FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
      get(:index, session: {'user_id': @user.id})
      expect(response).to have_http_status :success
      expect(assigns[:books].count).to eq 5
    end
  end
end