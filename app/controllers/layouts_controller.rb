class LayoutsController < ApplicationController
  def index
    render 'layouts/application'
  end

  def nothing
    render nothing: true
  end
end
