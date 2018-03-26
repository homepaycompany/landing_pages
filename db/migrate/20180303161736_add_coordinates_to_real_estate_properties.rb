class AddCoordinatesToRealEstateProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :real_estate_properties, :latitude, :float
    add_column :real_estate_properties, :longitude, :float
  end
end
