class StoreSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :category_id
  attribute :user_id
end
