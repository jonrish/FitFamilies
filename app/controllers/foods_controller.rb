class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    @fruit = FoodType.find_by_id(1)
    @dairy = FoodType.find_by_id(2)
    @carb = FoodType.find_by_id(3)
    @protein = FoodType.find_by_id(4)
    @fat = FoodType.find_by_id(5)
    @breakfast = FoodCategory.find_by_id(1)
    @lunch = FoodCategory.find_by_id(2)
    @dinner = FoodCategory.find_by_id(3)
    @snack = FoodCategory.find_by_id(4)
    @treat = FoodCategory.find_by_id(5)
  end

  def create
    @food = Food.new(params[:food])

    if @food.save
      redirect_to @food, notice: 'Food item succesfully created.'
    else
      render action: 'new'
    end
  end

  def show
    @food = Food.find(params[:id])
    @food_category = FoodCategory.find(@food.food_category_id)
    @food_type = FoodType.find(@food.food_type_id)
  end
end
