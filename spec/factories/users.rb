FactoryBot.define do
  factory :user do
    name      'Kilmer'
    nickname  'tMK'
    password  'mong'

    after(:create) do |user|
      user.shelf = Shelf.create
    end
  end
end
