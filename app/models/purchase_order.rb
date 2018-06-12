class PurchaseOrder < ApplicationRecord
  belongs_to :coin
  attr_accessor :priceNow
end
