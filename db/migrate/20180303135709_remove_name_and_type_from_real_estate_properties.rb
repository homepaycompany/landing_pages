class RemoveNameAndTypeFromRealEstateProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :property_images, :type
    remove_column :property_images, :name
  end
end
