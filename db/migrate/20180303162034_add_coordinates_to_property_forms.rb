class AddCoordinatesToPropertyForms < ActiveRecord::Migration[5.1]
  def change
    add_column :property_forms, :latitude, :float
    add_column :property_forms, :longitude, :float
  end
end
