class RestaurantsController < ApplicationController
  def index
    @rows = collection
    @total = total
  end

  def show
    @restaurant = Restaurant.find_by_permalink params[:id]
  end

  private

  def criteria
    Restaurant.includes(:address)
  end

  def collection
    per_page = (params[:per_page] || '20').to_i
    page = (params[:page] || '1').to_i
    criteria.limit(per_page).offset((page - 1) * per_page).order('assets.created_at DESC')
  end

  def total
    criteria.count
  end
end
