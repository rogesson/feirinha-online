class Store < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :products
end
