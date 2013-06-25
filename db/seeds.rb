FoodCategory.create(food_category: 'Breakfast')
FoodCategory.create(food_category: 'Lunch')
FoodCategory.create(food_category: 'Dinner')
FoodCategory.create(food_category: 'Snack')
FoodCategory.create(food_category: 'Treat')

FoodType.create(food_type: 'Fruits & Vegetables')
FoodType.create(food_type: 'Milk & Dairy')
FoodType.create(food_type: 'Carbs (like Bread & Pasta)')
FoodType.create(food_type: 'Protein (like Meat, Fish & Beans)')
FoodType.create(food_type: 'Fat (like Butter, Oil & Cheese)')

Food.create(name: 'Cheerios', food_category_id: 1, food_type_id: 3)
Food.create(name: 'Bacon', food_category_id: 1, food_type_id: 4)
Food.create(name: 'Grapefruit', food_category_id: 1, food_type_id: 1)
Food.create(name: 'Cream Cheese', food_category_id: 1, food_type_id: 5)
Food.create(name: 'Yogurt', food_category_id: 1, food_type_id: 2)

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
