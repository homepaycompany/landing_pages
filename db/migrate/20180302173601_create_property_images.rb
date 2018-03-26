class CreatePropertyImages < ActiveRecord::Migration[5.1]
  def change
    create_table :property_images do |t|
      t.string :photo
      t.string :name
      t.string :type

      t.timestamps
    end
    add_reference :property_images, :real_estate_property, foreign_key: true
  end
end
