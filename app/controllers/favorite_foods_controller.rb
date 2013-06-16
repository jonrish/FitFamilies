class FavoriteFoodsController < ApplicationController
  def index
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_foods = @child_account.favorite_foods
  end

  def new
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = @child_account.favorite_foods.build
  end

  def create
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = @child_account.favorite_foods.build(params[:favorite_food])

    if @favorite_food.save
      redirect_to child_account_favorite_foods_path(@child_account), notice: 'Your new food is now a favorite.'
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
