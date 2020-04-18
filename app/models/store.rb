class Store < ActiveRecord::Base
  belongs_to :user
  has_one :category
  has_one :status
end