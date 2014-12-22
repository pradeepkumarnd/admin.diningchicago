class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.order('name ASC')
  end
end
