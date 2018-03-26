class AddTokenToPropertyForms < ActiveRecord::Migration[5.1]
  def change
    add_column :property_forms, :token, :string
    add_column :real_estate_properties, :token, :string
  end
end
