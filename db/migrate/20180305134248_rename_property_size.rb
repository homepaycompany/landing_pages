class RenamePropertySize < ActiveRecord::Migration[5.1]
  def change
    remove_column :property_forms, :appartment_size_sqm
    remove_column :real_estate_properties, :appartment_size_sqm
  end
end
