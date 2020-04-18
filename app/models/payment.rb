class Payments < ActiveRecord::Base
  belongs_to :user
  has_one :status
end