class RenameTypeInRequestType < ActiveRecord::Migration[5.1]
  def change
    rename_column :requests, :type, :request_type
  end
end
