class User < ActiveRecord::Base
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :stores
  has_many :payments

  def role
    Role.find_by_id(role_id)
  end
end
