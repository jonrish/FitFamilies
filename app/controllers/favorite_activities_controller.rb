class FavoriteActivitiesController < ApplicationController
  def new
    @child_account = ChildAccount.find(params[:child_account_id])
    @favorite_activity = @child_account.favorite_activities.build
  end
end