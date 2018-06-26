require 'rails_helper'

RSpec.describe ConsultBooksController, type: :controller do
  before :all do
    @user = FactoryBot.create :user
    FactoryBot.create_list(:book, 5, shelf_id: @user.shelf.id)
  end

  describe 'index' do
    it 'should return home page' do
      get :index, session: {'user_id': @user.id}
      expect(response).to have_http_status :success
    end
  end

end