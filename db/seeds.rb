# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
