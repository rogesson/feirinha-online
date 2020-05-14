class AddTermToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :term, :datetime
  end
end
