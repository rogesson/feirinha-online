class Order < ApplicationRecord
  include Serialize

  belongs_to :user
  belongs_to :store
  belongs_to :order_status
  has_many :products_orders, dependent: :destroy

  def self.load_history(user)
    Order.where(user_id: user.id,
                order_status_id: OrderStatus.where(name: ['Enviado', 'Entregue', 'Cancelado']))
  end

  def self.load_open_order(user, store)
    Order.find_by(user_id: user.id,
                  store_id: store.id,
                  order_status_id: OrderStatus.find_by(name: 'Aberto').id)
  end
end
