class UserSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :email
  attribute :authentication_token
end
