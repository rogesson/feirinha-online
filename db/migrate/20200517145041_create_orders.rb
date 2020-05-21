class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.references :user, foreign_key: true
      t.references :store, foreign_key: true
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
