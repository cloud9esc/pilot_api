FactoryBot.define do
	factory :comment do
		commenter { Faker::StarWars.character }
		done false
		review_id nil
	end
end