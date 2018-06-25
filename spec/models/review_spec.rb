require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'relations' do
    it { should belong_to :book }
  end

  context 'validations' do
    it { should validate_presence_of(:description).on(:create) }
    it { should validate_presence_of(:description).on(:update) }
    it { should validate_presence_of(:book_id).on(:create) }
    it { should validate_presence_of(:book_id).on(:update) }
  end
end
