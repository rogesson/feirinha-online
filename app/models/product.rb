class Product < ActiveRecord::Base
  include Serialize

  belongs_to :store
end
