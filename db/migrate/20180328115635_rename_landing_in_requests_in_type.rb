class RenameLandingInRequestsInType < ActiveRecord::Migration[5.1]
  def change
    rename_column :requests, :landing, :type
  end
end
