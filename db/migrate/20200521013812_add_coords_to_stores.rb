class AddCoordsToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :coord_1, :string
    add_column :stores, :coord_2, :string
  end
end
