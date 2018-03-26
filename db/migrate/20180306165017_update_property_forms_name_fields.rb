class UpdatePropertyFormsNameFields < ActiveRecord::Migration[5.1]
  def change
    rename_column :property_forms, :name, :first_name
    rename_column :property_forms, :surname, :last_name
  end
end
