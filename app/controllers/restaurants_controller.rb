class RestaurantsController < ApplicationController
  def index
    @rows = collection
    @total = total
  end

  private

  def criteria
    Restaurant.includes(:address).limit(10)
  end

  def collection
    criteria
  end

  def total
    criteria.count
  end
end
