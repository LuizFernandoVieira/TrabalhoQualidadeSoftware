require 'rails_helper'

RSpec.describe Shelf, type: :model do
  context "relations" do
    it { should have_many :books }
    it { should belong_to :user }
  end

  context 'validations' do
    it { should validate_presence_of(:user_id).on(:create) }
    it { should validate_presence_of(:user_id).on(:update) }
  end
end
