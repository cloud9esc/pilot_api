FactoryBot.define do
  factory :review do
    title { Faker::Lorem.word }
    author { Faker::Number.number(digits: 10) }
    category_id { nil }
  end
end
