require 'spec_helper'

describe Seeders::Foods do

	let(:file_path) { File.join(Rails.root, "spec/support/file_fixtures/food.txt") }
	let(:seeder) { Seeders::Foods }

	it 'seeds a food with the correct category' do
		seeder.seed_with(file_path)
		food = Food.last
		type = FoodType.find_by_food_type("Milk, Dairy & Eggs")
		expect(food.food_type).to eql(type)
		expect(food.name).to eql("Butter, salted")
	end

end
