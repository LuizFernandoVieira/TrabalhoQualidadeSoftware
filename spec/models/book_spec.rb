require 'rails_helper'

RSpec.describe Book, type: :model do
  context "relations" do
    it { should have_many :reviews }
    it { should belong_to :shelf }
  end
end
