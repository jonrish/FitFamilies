FoodCategory.find_or_create_by_food_category(food_category: 'Breakfast')
FoodCategory.find_or_create_by_food_category(food_category: 'Lunch')
FoodCategory.find_or_create_by_food_category(food_category: 'Dinner')
FoodCategory.find_or_create_by_food_category(food_category: 'Snack')
FoodCategory.find_or_create_by_food_category(food_category: 'Treat')

Seeders::Activities.seed_with(File.join(Rails.root, "db/data_files/activities_db.txt"))

Seeders::Foods.seed_with(File.join(Rails.root, "db/data_files/food_db.txt"))
