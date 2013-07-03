module Seeders
	module Foods

		def self.seed_with(file_path)
			Food.destroy_all
			File.open(file_path, 'r').each_line do |line|
				create_food(line)
			end
		end

		def self.create_food(line)
			data = line.gsub!(/~*/,"").split('^')
			food_type_name = food_map[data[1]]

			if food_type_name
				food = Food.new
				food.name = data[2]
				food.food_type = FoodType.find_or_create_by_food_type(food_type_name)
				food.save
				puts food.id
			end

		end

		def self.food_map
			{
				"0900" => "Fruits & Vegetables",
				"1100" => "Fruits & Vegetables",
				"0100" => "Milk, Dairy & Eggs",
				"0800" => "Carbs (like Bread & Pasta)",
				"2000" => "Carbs (like Bread & Pasta)",
				"0500" => "Protein (like Meat, Fish & Beans)",
				"0700" => "Protein (like Meat, Fish & Beans)",
				"1000" => "Protein (like Meat, Fish & Beans)",
				"1200" => "Protein (like Meat, Fish & Beans)",
				"1300" => "Protein (like Meat, Fish & Beans)",
				"1500" => "Protein (like Meat, Fish & Beans)",
				"1600" => "Protein (like Meat, Fish & Beans)",
				"1700" => "Protein (like Meat, Fish & Beans)",
				"0400" => "Fat (like Butter, Oil & Cheese)",
				"1800" => "Sweets & Treats",
				"1900" => "Sweets & Treats",
				"2100" => "Sweets & Treats",
				"2500" => "Sweets & Treats",
				"0600" => "Meals & Combinations",
				"2200" => "Meals & Combinations",
			}
		end
	end
end
