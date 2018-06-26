FactoryBot.define do
  factory :book do
    sequence :title do |n|
      "Harry Potter #{n}"
    end
    author  'JK Rolling'
    sequence :code do |n|
      "#{n}"
    end
  end
end
