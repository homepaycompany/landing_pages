class PropertyImagesController < ApplicationController
  before_action :set_property_form, only: [:create]

  def create
    image = PropertyImage.new()
    image.photo = params[:file]
    image.property_form = @property_form
    if image.save
      respond_to do |format|
        format.json do
          json = {id: image.id}
          render json: json
        end
      end
    end
  end

  private

  def set_property_form
    @property_form = PropertyForm.find(params[:property_form_id])
  end
end
