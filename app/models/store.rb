class Store < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_many :products

  before_save :set_term

  def serialize
    StoreSerializer.new(self).to_hash
  end

  private

  def set_term
    self.term = Date.new(2020, 05, 22) + 180.days
  end
end
