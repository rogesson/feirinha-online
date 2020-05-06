class Store < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :products

  def serialize
    StoreSerializer.new(self).to_hash
  end
end
