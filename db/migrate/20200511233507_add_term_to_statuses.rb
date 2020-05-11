class AddTermToStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :statuses, :term, :datetime
  end
end
