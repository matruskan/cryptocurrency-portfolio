class PurchaseOrdersController < ApplicationController
    def index
        @purchaseOrders = PurchaseOrder.all
    end
    def new
        @purchaseOrder = PurchaseOrder.new
        @purchaseOrder.quantity = 1
        @purchaseOrder.coin = Coin.find(params[:coin_id])
        @purchaseOrder.coin.price = CoinsController.fetch_price(@purchaseOrder.coin.symbol)
        @coin = @purchaseOrder.coin
    end
end
