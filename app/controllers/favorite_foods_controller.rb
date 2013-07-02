class FavoriteFoodsController < ApplicationController
  before_filter :authenticate_family_account!
  before_filter :find_child
  before_filter :right_kid?
  before_filter :right_food?, :except => [:new, :create, :index]

  def index
    @search = @child_account.favorite_foods.search(params[:q])
    @favorite_foods = @search.result.page(params[:page]).per(params[:limit] || 15)    
  end

  def new
    @favorite_food = @child_account.favorite_foods.build
  end

  def create
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
      redirect_to child_account_favorite_foods_path(@favorite_food.child_account)
      flash[:notice] = 'Your favorite has been updated'
    else
      render action: 'edit'
    end

  end

  def show
    @favorite_food = FavoriteFood.find(params[:id])
  end

  def destroy
    @favorite_food = FavoriteFood.find(params[:id])
    @favorite_food.destroy

    redirect_to child_account_favorite_foods_path(@child_account)
    flash[:notice] = 'Your food has been removed from your list of favorites.'
  end

  protected
    def find_child
      @child_account = ChildAccount.find(params[:child_account_id])
    end

    def right_kid?
      if @child_account.family_account != current_family_account
        redirect_to root_path
      end
    end

    def right_food?
      @favorite_food = FavoriteFood.find(params[:id])
      if @favorite_food.child_account != @child_account
        redirect_to root_path
      end
    end

end
