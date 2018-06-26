require 'rails_helper'

RSpec.describe ConsultBooksController, type: :controller do
  before :all do
    @user = FactoryBot.create :user
    @user2 = FactoryBot.create :user
    FactoryBot.create(:book, shelf_id: @user.shelf.id, title: 'Only One')
    FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
    FactoryBot.create_list(:book, 7, shelf_id: @user2.shelf.id)
  end

  describe 'index' do
    it 'should return all user books' do
      get :index, session: {'user_id': @user.id}
      expect(assigns[:books].count).to eq Book.count
      get :index, session: {'user_id': @user.id}, params: {search: 'Only One'}
      expect(assigns[:books].count).to eq 1
    end
  end

end