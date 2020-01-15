FactoryBot.define do
	factory :review do
		title { Faker::Lorem.word }
		author { Faker::Number.number(10) }
	end
end