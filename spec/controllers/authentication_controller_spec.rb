require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  before :all do
    @user = FactoryBot.create :user
    @user2 = FactoryBot.create :user
    FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
    FactoryBot.create_list(:book, 7, shelf_id: @user2.shelf.id)
  end

  describe 'login' do
    it 'should login' do
      # get :index, session: {'user_id': @user.id}
      # expect(assigns[:books].count).to eq Book.count
      # get :index, session: {'user_id': @user.id}, params: {search: 'Harry Potter 1'}
      # expect(assigns[:books].count).to eq Book.where('title LIKE ?', '%Harry Potter 1%').count
    end
  end

  describe 'new_user' do
    it 'new_user' do
      count = User.count
      get :new_user, params: {'name': 'Luiz', 'nickname': 'plcn', 'phone_number': '61999876543'}
      expect(User.count).to eq count + 1
    end
  end
end