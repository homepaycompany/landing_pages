class RealEstatePropertiesController < ApplicationController
  def index
    @properties = RealEstateProperty.all
    filter_properties
    sort_properties
    @markers = @properties.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude
      }
    end
  end

  def show
    @property = RealEstateProperty.find(params[:id])
  end

  private
  def filter_properties
    @price_min = params['price_min'].to_i
    @price_max = params['price_max'].to_i
    @surface_min = params['surface_min'].to_i
    @surface_max = params['surface_max'].to_i
    if params['room_5'] == "1"
      @room_nb = 5
    elsif params['room_4'] == "1"
      @room_nb = 4
    elsif params['room_3'] == "1"
      @room_nb = 3
    elsif params['room_2'] == "1"
      @room_nb = 2
    else
      @room_nb = 0
    end
    @properties = @properties.where("price >= :price_min", price_min: @price_min) if @price_min > 0
    @properties = @properties.where("price <= :price_max", price_max: @price_max) if @price_max > 0
    @properties = @properties.where("livable_size_sqm >= :surface_min", surface_min: @surface_min) if @surface_min > 0
    @properties = @properties.where("livable_size_sqm <= :surface_max", surface_max: @surface_max) if @surface_max > 0
    @properties = @properties.where("num_rooms >= :rooms", rooms: @room_nb) if @room_nb > 1
  end

  def sort_properties
    @sort_type = params["sort"]
    if @sort_type == "a-price"
      @properties = @properties.order(price: :asc)
    elsif @sort_type == "d-price"
      @properties = @properties.order(price: :desc)
    elsif @sort_type == "a-surface"
      @properties = @properties.order(livable_size_sqm: :asc)
    elsif @sort_type == "d-surface"
      @properties = @properties.order(livable_size_sqm: :desc)
    elsif @sort_type == "a-date"
      @properties = @properties.order(created_at: :asc)
    else
      @properties = @properties.order(created_at: :desc)
    end
  end
end
