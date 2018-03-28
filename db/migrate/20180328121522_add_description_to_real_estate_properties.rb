class AddDescriptionToRealEstateProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :real_estate_properties, :description, :text
  end
end
