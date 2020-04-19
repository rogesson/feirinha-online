class Category < ActiveRecord::Base
  has_many :stores
  has_many :products
end
