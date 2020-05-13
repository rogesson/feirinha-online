class AddStatusIdToStores < ActiveRecord::Migration[5.2]
  def change
    add_reference :stores, :status, foreign_key: true
  end
end
