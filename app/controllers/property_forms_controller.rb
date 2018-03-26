class PropertyFormsController < ApplicationController
  before_action :set_property_form,
  only: [:show,
    :update,
    :destroy,
    :block_if_complete,
    :a_address_validation,
    :b_property_type_selection,
    :c_description_1,
    :d_description_2,
    :e_description_3,
    :f_add_images,
    :g_personnal_information,
    :h_confirmation,
    :i_validation]

    before_action :block_if_complete, only: [:show,
    :update,
    :a_address_validation,
    :b_property_type_selection,
    :c_description_1,
    :d_description_2,
    :e_description_3,
    :f_add_images,
    :g_personnal_information,
    :h_confirmation,
    :i_validation]

  # CRUD actions
  def show
  end

  def new
    @property_form = PropertyForm.new
  end

  def create
    @property_form = PropertyForm.create(token: set_property_form_token)
    @property_form .update(property_form_params)
    redirect_to form_step_1_path(@property_form.token)
  end

  def update
    if @property_form.update(property_form_params)
      head :no_content, status: :ok
    else
      render  @property_form.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @property_form.destroy
      redirect_to root_path
    end
  end

  # FORM SPECIFIC ACTIONS

  def a_address_validation
    @marker = { lat: @property_form.latitude, lng: @property_form.longitude }
  end

  def b_property_type_selection
  end

  def c_description_1
    if params[:property_type]
      unless @property_form.update(property_type: params[:property_type])
        flash[:alert] = "Un erreur est survenue - le formulaire n'a pas pu être créé"
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def d_description_2
  end

  def e_description_3
  end

  def f_add_images
    @property_image = PropertyImage.new
  end

  def g_personnal_information
  end

  def h_confirmation
    if User.find_by(email: @property_form.email)
      user = User.find_by(email: @property_form.email)
    else
      user = User.create_instance_from_property_form(@property_form)
      unless user.save
        flash[:alert] = "Un erreur est survenue - le formulaire n'a pas pu être créé"
        redirect_to root_path
      end
    end
    unless @property_form.update(user_id: user.id)
      lash[:alert] = "Un erreur est survenue - le formulaire n'a pas pu être créé"
      redirect_to root_path
    end
    @marker = { lat: @property_form.latitude, lng: @property_form.longitude }
  end

  def i_validation
    if @property_form.update(complete: true)
      property_attributes = {}
      @property_form.attributes.keys.each do |k|
        property_attributes[k] = @property_form.attributes[k] || false
      end
      property = RealEstateProperty.new(property_attributes.except('complete'))
      property.property_form = @property_form
      unless property.save
        flash[:alert] = "Un erreur est survenue - le formulaire n'a pas pu être créé"
        redirect_to root_path
      else
        @property_form.property_images.each do |i|
          i.update(real_estate_property_id: property.id)
        end
      end
    end
  end

  private

  def set_property_form
    if params[:token]
      @property_form = PropertyForm.find_by(token: params[:token])
    else
      @property_form = PropertyForm.find_by(id: params[:id])
    end
  end

  def property_form_params
    params.require(:property_form).permit(:address,
    :property_type,
    :livable_size_sqm,
    :num_rooms,
    :num_bedrooms,
    :num_bathrooms,
    :has_terrace,
    :has_cellar,
    :property_state,
    :kitchen_state,
    :bathroom_state,
    :appartment_size_sqm,
    :appartment_floor,
    :building_state,
    :has_works_in_building_planned,
    :building_construction_year,
    :has_elevator,
    :has_parking,
    :has_balcony,
    :property_total_size_sqm,
    :num_floors,
    :has_garage,
    :has_pool,
    :has_attic,
    :ground_floor_size_sqm,
    :size_cellar_sqm,
    :size_balcony_sqm,
    :size_terrace_sqm,
    :is_attic_convertible,
    :first_name,
    :last_name,
    :email,
    :phone_number,
    :time_to_sell)
  end

  def set_property_form_token
    tokens = PropertyForm.all.map{|p| p.token}
    o = [(1..9), ('A'..'Z')].map(&:to_a).flatten
    token = (0...10).map { o[rand(o.length)] }.join
    while tokens.include?(token)
      token = (0...10).map { o[rand(o.length)] }.join
    end
    return token
  end

  def block_if_complete
    if @property_form.complete
      flash[:alert] = "Ce formulaire est finalisé et ne peut être édité"
      redirect_to root_path
    end
  end
end
