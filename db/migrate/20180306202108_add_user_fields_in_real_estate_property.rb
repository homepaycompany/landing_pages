class AddUserFieldsInRealEstateProperty < ActiveRecord::Migration[5.1]
  def change
    add_column :real_estate_properties, :first_name, :string
    add_column :real_estate_properties, :last_name, :string
    add_column :real_estate_properties, :email, :string
    add_column :real_estate_properties, :phone_number, :string
  end
end
