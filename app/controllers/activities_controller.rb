class ActivitiesController < ApplicationController
  def index
    @search = Activity.search(params[:q])
    @activities = @search.result.page(params[:page]).per(params[:limit] || 15)
  end

  def show
    @activity = Activity.find(params[:id])
  end
end