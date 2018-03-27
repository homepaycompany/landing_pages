class RealEstatePropertiesController < ApplicationController
  def index
    @properties = RealEstateProperty.all
  end

  def show
  end
end
