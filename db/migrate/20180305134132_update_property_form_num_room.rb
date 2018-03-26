class UpdatePropertyFormNumRoom < ActiveRecord::Migration[5.1]
  def change
    rename_column :property_forms, :num_room, :num_rooms
    rename_column :real_estate_properties, :num_room, :num_rooms
  end
end
