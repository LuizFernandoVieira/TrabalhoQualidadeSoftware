require 'rails_helper'

RSpec.describe User, type: :model do
  context "relations" do
    it { should have_one :shelf }
  end
end
