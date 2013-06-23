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
end