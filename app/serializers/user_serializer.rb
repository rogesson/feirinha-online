class UserSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :email
  attribute :role_name
  attribute :role_id

  def role_name
    object.role.name
  end
end
