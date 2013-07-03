FoodCategory.create(food_category: 'Breakfast')
FoodCategory.create(food_category: 'Lunch')
FoodCategory.create(food_category: 'Dinner')
FoodCategory.create(food_category: 'Snack')
FoodCategory.create(food_category: 'Treat')

ActivityCategory.create(activity_category: 'Team Sport')
ActivityCategory.create(activity_category: 'Cardio')
ActivityCategory.create(activity_category: 'Upper Body')
ActivityCategory.create(activity_category: 'Core')
ActivityCategory.create(activity_category: 'Legs')

Activity.create(name: 'Hockey', activity_category_id: 1, description: 'fast-paced on ice')
Activity.create(name: 'Walking', activity_category_id: 2, description: 'easy to do & good for you too')
Activity.create(name: 'Chest Press', activity_category_id: 3, description: 'works major muscles')
Activity.create(name: 'Crunches', activity_category_id: 4, description: 'good form is important')
Activity.create(name: 'Leg Extensions', activity_category_id: 5, description: 'works the quads')

Seeders::Foods.seed_with(File.join(Rails.root, "db/data_files/food_db.txt"))
