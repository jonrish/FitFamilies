class ActivitiesController < ApplicationController
  def index
    @search = Activity.search(params[:q])
    @activities = @search.result
  end

  def show
    @activity = Activity.find(params[:id])
  end
end