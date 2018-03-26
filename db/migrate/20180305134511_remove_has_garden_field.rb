class RemoveHasGardenField < ActiveRecord::Migration[5.1]
  def change
    remove_column :property_forms, :size_garden_sqm
    remove_column :real_estate_properties, :size_garden_sqm
  end
end
