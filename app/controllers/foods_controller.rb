class FoodsController < ApplicationController

  def index
    @search = Food.search(params[:q])
    @foods = @search.result.page(params[:page]).per(params[:limit] || 15)
  end

end
