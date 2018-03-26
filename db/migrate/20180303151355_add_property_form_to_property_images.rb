class AddPropertyFormToPropertyImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :property_images, :property_form, foreign_key: true
  end
end
