class AddImageUrlToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :image_url, :string
  end
end
