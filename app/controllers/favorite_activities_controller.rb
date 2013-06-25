class FavoriteActivitiesController < ApplicationController
  before_filter :authenticate_family_account!

  def index
    @child_account = ChildAccount.find(params[:child_account_id])
    @search = @child_account.favorite_activities.search(params[:q])
    @favorite_activities = @search.result   
  end

  def new
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_activity = @child_account.favorite_activities.build
  end

  def create
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_activity = @child_account.favorite_activities.build(params[:favorite_activity])

    if @favorite_activity.save
      redirect_to child_account_favorite_activities_path(@child_account)
      flash[:notice] =  'The activity has been added to your favorites'
    else
      render action: 'new'
    end
  end

  def show
    @child_account = ChildAccount.find(params[:child_account_id])
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
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_activity = FavoriteActivity.find(params[:id])
    @favorite_activity.destroy

    redirect_to child_account_favorite_activities_path(@child_account)
    flash[:notice] = 'The activity has been removed from your favorites'
  end

end
