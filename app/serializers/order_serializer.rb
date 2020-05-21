class OrderSerializer < ActiveModel::Serializer
  attribute :id
  attribute :order_date
  attribute :order_status
  attribute :store
  attribute :products

  def products
    object.products_orders.map(&:serialize)
  end

  def store
    {
      id: object.store.id,
      name: object.store.name
    }
  end

  def order_status
    object.order_status.name
  end
end
