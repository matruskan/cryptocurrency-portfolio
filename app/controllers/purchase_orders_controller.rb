class PurchaseOrdersController < ApplicationController
    def index
        @purchaseOrders = PurchaseOrder.all
        @purchaseOrders.each do |purchaseOrder|
            purchaseOrder.priceNow = purchaseOrder.quantity * CoinsController.fetch_price(purchaseOrder.coin.symbol)
        end
    end

    def new
        @purchaseOrder = PurchaseOrder.new
        @purchaseOrder.quantity = 1
        @purchaseOrder.coin = Coin.find(params[:coin_id])
        @purchaseOrder.coin.price = CoinsController.fetch_price(@purchaseOrder.coin.symbol)
        @coin = @purchaseOrder.coin
    end

    def create
        #render plain: params[:purchaseOrder].inspect
        @purchaseOrder = PurchaseOrder.new(params.require(:purchaseOrder).permit(:quantity))
        coin = Coin.new(params.require(:coin).permit(:id))
        @purchaseOrder.coin = Coin.find(coin.id)
        @purchaseOrder.coin.price = CoinsController.fetch_price(@purchaseOrder.coin.symbol)
        @purchaseOrder.pricePaid = @purchaseOrder.coin.price * @purchaseOrder.quantity
        @purchaseOrder.save
        redirect_to @purchaseOrder
    end

    def show
        @purchaseOrder = PurchaseOrder.find(params[:id])
        @purchaseOrder.priceNow = @purchaseOrder.quantity * CoinsController.fetch_price(@purchaseOrder.coin.symbol)
    end
end
