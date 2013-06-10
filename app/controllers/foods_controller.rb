class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
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
