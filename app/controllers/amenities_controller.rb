class AmenitiesController < ApplicationController
  def index
    @amenities = Amenity.order('name ASC')
  end
end
