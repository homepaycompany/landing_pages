class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :landing

      t.timestamps
    end
  end
end
