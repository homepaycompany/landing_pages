class AddUserFieldsToPropertyForms < ActiveRecord::Migration[5.1]
  def change
    add_column :property_forms, :name, :string
    add_column :property_forms, :surname, :string
    add_column :property_forms, :email, :string
    add_column :property_forms, :phone_number, :string

    add_column :property_forms, :time_to_sell, :string
    add_column :real_estate_properties, :time_to_sell, :string
  end
end
