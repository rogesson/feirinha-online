class Product < ActiveRecord::Base
  include Serialize

  belongs_to :store
  has_many :products_orders
end
