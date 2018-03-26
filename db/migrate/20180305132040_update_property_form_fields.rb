class UpdatePropertyFormFields < ActiveRecord::Migration[5.1]
  def change
    add_column :property_forms, :has_pool, :boolean
    add_column :property_forms, :has_attic, :boolean
    add_column :property_forms, :is_attic_convertible, :boolean
    add_column :property_forms, :appartment_floor, :integer
    add_column :property_forms, :livable_size_sqm, :integer
    add_column :property_forms, :ground_floor_size_sqm, :integer
    remove_column :property_forms, :needs_renovation
    rename_column :property_forms, :num_floor, :num_floors
    rename_column :property_forms, :num_bedroom, :num_bedrooms
    rename_column :property_forms, :num_bathroom, :num_bathrooms
    rename_column :property_forms, :size_carrez_sqm, :appartment_size_sqm
    rename_column :property_forms, :size_total_sqm, :property_total_size_sqm

    add_column :real_estate_properties, :has_pool, :boolean
    add_column :real_estate_properties, :has_attic, :boolean
    add_column :real_estate_properties, :is_attic_convertible, :boolean
    add_column :real_estate_properties, :appartment_floor, :integer
    add_column :real_estate_properties, :livable_size_sqm, :integer
    add_column :real_estate_properties, :ground_floor_size_sqm, :integer
    remove_column :real_estate_properties, :needs_renovation
    rename_column :real_estate_properties, :num_floor, :num_floors
    rename_column :real_estate_properties, :num_bedroom, :num_bedrooms
    rename_column :real_estate_properties, :num_bathroom, :num_bathrooms
    rename_column :real_estate_properties, :size_carrez_sqm, :appartment_size_sqm
    rename_column :real_estate_properties, :size_total_sqm, :property_total_size_sqm
  end
end
