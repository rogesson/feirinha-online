class Store < ActiveRecord::Base
  include Serialize

  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_many :products
  has_many :orders

  before_save :set_term

  private

  def set_term
    self.term = Date.new(2020, 05, 22) + 180.days
  end
end
