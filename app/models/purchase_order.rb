class PurchaseOrder < ApplicationRecord
  belongs_to :coin
  attr_accessor :priceNow
  validates :quantity, presence: true,
                       numericality: {greater_than: 0}
  validates :pricePaid, presence: true,
                        numericality: {greater_than: 0}
end
