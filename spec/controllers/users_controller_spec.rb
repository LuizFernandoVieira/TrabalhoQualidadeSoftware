require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before :all do
    @user = FactoryBot.create :user, nickname: 'ktMK'
    FactoryBot.create_list(:user, 10)
  end

  describe 'index' do
    it 'should return books according to search query' do
      get :consult_users, session: {'user_id': @user.id}
      expect(assigns[:users].count).to eq User.count
      get :consult_users, session: {'user_id': @user.id}, params: {nickname: 'ktMK'}
      expect(assigns[:users].count).to eq User.where('nickname LIKE ?', 'ktMK').count
    end
  end

end