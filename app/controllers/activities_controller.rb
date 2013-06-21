class ActivitiesController < ApplicationController
  def index
    @search = Activity.search(params[:q])
    @activities = @search.result
  end
end