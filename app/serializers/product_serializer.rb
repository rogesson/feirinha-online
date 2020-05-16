class ProductSerializer < ActiveModel::Serializer
  attribute :name
  attribute :price
  attribute :store

  def store
    {
      id: object.store.id,
      name: object.store.name
    }
  end
end
