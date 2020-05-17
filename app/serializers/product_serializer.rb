class ProductSerializer < ActiveModel::Serializer
  attribute :name
  attribute :price
  attribute :description
  attribute :image_url
  attribute :store

  def store
    {
      id: object.store.id,
      name: object.store.name
    }
  end
end
