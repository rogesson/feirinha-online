class StoreSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :phone_number
  attribute :image_url
  attribute :address
  attribute :coord_1
  attribute :coord_2
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
