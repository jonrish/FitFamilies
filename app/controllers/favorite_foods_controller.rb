class FavoriteFoodsController < ApplicationController
  def index
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_foods = @child_account.favorite_foods
  end

  def new
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = @child_account.favorite_foods.build
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
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = @child_account.favorite_foods.build(params[:favorite_food])

    if @favorite_food.save
      redirect_to child_account_favorite_food_path(@child_account,@favorite_food), notice: 'Your new food is now a favorite.'
    else
      render action: 'new'
    end
  end

  def edit
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = FavoriteFood.find(params[:id])
  end

  def show
    @favorite_food = FavoriteFood.find(params[:id])
  end
end