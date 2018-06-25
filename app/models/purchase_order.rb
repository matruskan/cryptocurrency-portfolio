class PurchaseOrder < ApplicationRecord
  belongs_to :coin
  def priceNow
    quantity * coin.price
  end

  validates :quantity, presence: true,
                       numericality: {greater_than: 0}
  validates :pricePaid, presence: true,
                        numericality: {greater_than: 0}
end
