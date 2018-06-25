require 'rails_helper'

RSpec.describe Shelf, type: :model do
  context "relations" do
    it { should have_many :books }
    it { should belong_to :user }
  end
end
