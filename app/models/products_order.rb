class ProductsOrder < ApplicationRecord
  include Serialize

  belongs_to :product
  belongs_to :order

  def self.add_new_product(order_id, product_id, quantity, total_price)
    ProductsOrder.create(order_id: order_id,
                         product_id: product_id,
                         quantity: quantity,
                         total_price: total_price)
  end

  def add_product_quantity(quantity)
    new_total_price = self.total_price + self.product.price * quantity
    new_quantity = self.quantity + quantity
    self.update(quantity: new_quantity, total_price: new_total_price)
  end

  def remove_product(quantity)
    self.destroy if quantity == self.quantity

    new_total_price = self.total_price - self.product.price * quantity
    new_quantity = self.quantity - quantity
    self.update(quantity: new_quantity, total_price: new_total_price)
  end

  def self.find_order(order, product_id)
    ProductsOrder.find_by(order.products_orders.find_by(product_id: product_id))
  end
end
