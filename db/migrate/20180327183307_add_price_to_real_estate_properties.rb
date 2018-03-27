class AddPriceToRealEstateProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :real_estate_properties, :price, :integer
    add_column :property_forms, :price, :integer

    add_column :real_estate_properties, :title, :string
    add_column :property_forms, :title, :string
  end
end
