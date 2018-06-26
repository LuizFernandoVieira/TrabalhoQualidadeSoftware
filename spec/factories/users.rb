FactoryBot.define do
  factory :user do
    name      'Kilmer'
    nickname  'Killmonger'
    password  'tMK'

    after(:create) do |user|
      user.shelf = Shelf.create
    end
  end
end
