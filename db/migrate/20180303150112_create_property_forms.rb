class CreatePropertyForms < ActiveRecord::Migration[5.1]
    def change
    create_table :property_forms do |t|
      t.string :address
      t.string :property_type
      t.integer :num_floor
      t.integer :num_room
      t.integer :num_bedroom
      t.integer :num_bathroom
      t.integer :size_carrez_sqm
      t.integer :size_total_sqm
      t.integer :size_garden_sqm
      t.integer :size_balcony_sqm
      t.integer :size_terrace_sqm
      t.integer :size_cellar_sqm
      t.integer :building_construction_year
      t.boolean :has_balcony
      t.boolean :has_garage
      t.boolean :has_terrace
      t.boolean :has_cellar
      t.boolean :has_parking
      t.boolean :has_elevator
      t.boolean :has_works_in_building_planned
      t.boolean :needs_renovation
      t.string :building_state
      t.string :property_state
      t.string :kitchen_state
      t.string :bathroom_state
      t.boolean :complete

      t.timestamps
    end
    add_reference :property_forms, :user, foreign_key: true
  end
end
