class RenameStatusToStatuses < ActiveRecord::Migration[5.2]
  def change
    rename_table :status, :statuses
  end
end
