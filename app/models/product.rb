class Product < ActiveRecord::Base
  belongs_to :store
  has_one :category
end