FactoryBot.define do
  factory :category do
    name { Faker::JapaneseMedia::DragonBall.character }
  end
end
