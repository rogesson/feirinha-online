class RemoveLocaleFromStores < ActiveRecord::Migration[5.2]
  def change
    remove_column :stores, :locale
  end
end
