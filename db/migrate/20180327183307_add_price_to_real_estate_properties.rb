class AddPriceToRealEstateProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :real_estate_properties, :price, :integer
  end
end
