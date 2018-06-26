require 'rails_helper'

RSpec.describe Book, type: :model do
  context "relations" do
    it { should have_many :reviews }
    it { should belong_to :shelf }
  end

  context 'validations' do
    it { should validate_presence_of(:title).on(:create) }
    it { should validate_presence_of(:author).on(:create) }
    it { should validate_presence_of(:code).on(:create) }
    it { should validate_presence_of(:shelf_id).on(:create) }
  end
end
