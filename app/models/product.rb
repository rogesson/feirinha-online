class Product < ActiveRecord::Base
  belongs_to :store

  def serialize
    ProductSerializer.new(self).to_hash
  end
end
