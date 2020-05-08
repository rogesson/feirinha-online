class StoreSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :category
  attribute :user
  attribute :products

  def category
    {
      id: object.category_id,
      name: object.category.name
    }
  end

  def user
    {
      id: object.user_id,
      name: object.user.name
    }
  end

  def products
    object.products
  end
end
