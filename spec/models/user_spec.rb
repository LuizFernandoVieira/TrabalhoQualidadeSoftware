require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relations' do
    it { should have_one :shelf }
  end

  context 'validations' do
    it { should validate_presence_of(:name).on(:create) }
    it { should validate_presence_of(:name).on(:update) }
    it { should validate_presence_of(:nickname).on(:create) }
    it { should validate_presence_of(:nickname).on(:update) }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_presence_of(:password).on(:update) }
  end
end
