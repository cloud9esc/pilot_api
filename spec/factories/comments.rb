FactoryBot.define do
  factory :comment do
    commenter { Faker::JapaneseMedia::DragonBall.character }
    content { Faker::Quote }
    review
  end
end
