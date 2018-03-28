class RealEstatePropertiesController < ApplicationController
  def index
    @properties = RealEstateProperty.all
  end

  def show
    @property = RealEstateProperty.find(params[:id])
    @property_form = @property.property_form
  end
end
