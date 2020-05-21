class CreateProductsOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :products_orders do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
