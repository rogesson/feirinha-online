class RemoveCategoryIdFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :category_id
  end
end
