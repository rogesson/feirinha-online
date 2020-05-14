class RemoveTermFromStatuses < ActiveRecord::Migration[5.2]
  def change
    remove_column :statuses, :term
  end
end
