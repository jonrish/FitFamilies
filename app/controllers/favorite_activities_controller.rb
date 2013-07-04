class FavoriteActivitiesController < ApplicationController
  before_filter :authenticate_family_account!
  before_filter :find_child
  before_filter :right_kid?
  before_filter :right_activity?, :except => [:new, :create, :index]

  def index
    @search = @child_account.favorite_activities.search(params[:q])
    @favorite_activities = @search.result.page(params[:page]).per(params[:limit] || 15)   
  end

  def new
    @favorite_activity = @child_account.favorite_activities.build
  end

  def create
    @favorite_activity = @child_account.favorite_activities.build(params[:favorite_activity])

    if @favorite_activity.save
      redirect_to child_account_favorite_activities_path(@child_account)
      flash[:notice] =  'The activity has been added to your favorites'
    else
      render action: 'new'
    end
  end

  def show
    @favorite_activity = FavoriteActivity.find(params[:id])
  end

  def edit
    @favorite_activity = FavoriteActivity.find(params[:id])
  end

  def update
    @favorite_activity = FavoriteActivity.find(params[:id])

    if @favorite_activity.update_attributes(params[:favorite_activity])
      redirect_to child_account_favorite_activities_path(@favorite_activity.child_account)
      flash[:notice] = 'Your activity has been updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @favorite_activity = FavoriteActivity.find(params[:id])
    @favorite_activity.destroy

    redirect_to child_account_favorite_activities_path(@child_account)
    flash[:notice] = 'The activity has been removed from your favorites'
  end

  protected

    def right_activity?
      @favorite_activity = FavoriteActivity.find(params[:id])
      if @favorite_activity.child_account != @child_account
        redirect_to root_path
      end
    end

end
