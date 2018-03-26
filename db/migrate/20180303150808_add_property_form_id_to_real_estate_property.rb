class AddPropertyFormIdToRealEstateProperty < ActiveRecord::Migration[5.1]
  def change
    add_reference :real_estate_properties, :property_form, foreign_key: true
  end
end
