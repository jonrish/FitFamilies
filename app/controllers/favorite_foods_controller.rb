class FavoriteFoodsController < ApplicationController
  before_filter :authenticate_family_account!

  def index
    @child_account = ChildAccount.find(params[:child_account_id])
    # @favorite_foods = @child_account.favorite_foods

    @search = @child_account.favorite_foods.search(params[:q])
    @favorite_foods = @search.result    
  end

  def new
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = @child_account.favorite_foods.build
  end

  def create
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = @child_account.favorite_foods.build(params[:favorite_food])


    if @favorite_food.save
      redirect_to child_account_favorite_foods_path(@child_account), notice: 'Your food is now a favorite.'
    else
      render action: 'new'
    end
  end

  def edit
    @favorite_food = FavoriteFood.find(params[:id])
  end

  def update
    @favorite_food = FavoriteFood.find(params[:id])

    if @favorite_food.update_attributes(params[:favorite_food])
      redirect_to child_account_favorite_foods_path(@favorite_food.child_account), notice: 'Your favorite has been updated'
    else
      render action: 'edit'
    end

  end

  def show
    @favorite_food = FavoriteFood.find(params[:id])
  end

  def destroy
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_food = FavoriteFood.find(params[:id])
    @favorite_food.destroy

    redirect_to child_account_favorite_foods_path(@child_account), notice: 'Your food has been removed from your list of favorites.'
  end

end
