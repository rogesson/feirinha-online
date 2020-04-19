class RemoveStatusIdFromStores < ActiveRecord::Migration[5.2]
  def change
    remove_column :stores, :status_id
  end
end
