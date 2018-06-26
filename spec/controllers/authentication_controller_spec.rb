require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  before :all do
    @user = FactoryBot.create :user
    @user2 = FactoryBot.create :user
    FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
    FactoryBot.create_list(:book, 7, shelf_id: @user2.shelf.id)
  end

  # describe 'login' do
  #   it 'should login' do
  #     # get :index, session: {'user_id': @user.id}
  #     # expect(assigns[:books].count).to eq Book.count
  #     # get :index, session: {'user_id': @user.id}, params: {search: 'Harry Potter 1'}
  #     # expect(assigns[:books].count).to eq Book.where('title LIKE ?', '%Harry Potter 1%').count
  #   end
  # end

  describe 'new_user' do
    it 'new_user with correct data' do
      count = User.count
      get :new_user, params: {'name': 'Luiz', 'nickname': 'plcn', 'phone_number': '61999876543', password: 'asdf'}
      expect(User.count).to eq count + 1
    end

    it 'new_user with missing required data' do
      count = User.count
      get :new_user, params: {'nickname': 'plcn', 'phone_number': '61999876543', password: 'asdf'}
      expect(User.count).to eq count
      get :new_user, params: {'name': 'Luiz', 'phone_number': '61999876543', password: 'asdf'}
      expect(User.count).to eq count
      get :new_user, params: {'name': 'Luiz', 'nickname': 'plcn', 'phone_number': '61999876543'}
      expect(User.count).to eq count
    end

    it 'new_user with invalid data' do
      count = User.count
      get :new_user, params: {'name': 'Nome com mais de 15  chars', 'nickname': 'plcn',
                              'phone_number': '61999876543', password: 'asdf'}
      get :new_user, params: {'name': 'NomeComNum15', 'nickname': 'plcn',
                              'phone_number': '61999876543', password: 'asdf'}
      expect(User.count).to eq count
      get :new_user, params: {'name': 'Luiz.', 'nickname': 'Apelido com mais de 5 chars',
                              'phone_number': '61999876543', password: 'asdf'}
      expect(User.count).to eq count
      get :new_user, params: {'name': 'Luiz ', 'nickname': 'plcn',
                              'phone_number': 'fone com mais de 11', password: 'asdf'}
      expect(User.count).to eq count
      get :new_user, params: {'name': 'Luiz', 'nickname': 'plcn',
                              'phone_number': '61999876543', password: 'senha com mais de 4 chars'}
      expect(User.count).to eq count
    end
  end
end