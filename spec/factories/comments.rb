FactoryBot.define do
  factory :comment do
    commenter { Faker::JapaneseMedia::DragonBall.character }
    review_id { nil }
  end
end
