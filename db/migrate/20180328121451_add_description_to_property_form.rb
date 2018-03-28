class AddDescriptionToPropertyForm < ActiveRecord::Migration[5.1]
  def change
    add_column :property_forms, :description, :text
  end
end
