class ProductsOrderSerializer < ActiveModel::Serializer
  attribute :product_name
  attribute :quantity
  attribute :total_price

  def product_name
    object.product.name
  end
end
