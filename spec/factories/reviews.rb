FactoryBot.define do
  factory :review do
    title { Faker::Lorem.word }
    author { Faker::Color }
    category
  end
end
