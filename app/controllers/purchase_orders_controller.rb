class PurchaseOrdersController < ApplicationController
    def index
        @purchaseOrders = PurchaseOrder.all
        @purchaseOrders.each do |purchaseOrder|
            purchaseOrder.priceNow = purchaseOrder.quantity * CoinsController.fetch_price(purchaseOrder.coin.symbol)
        end
    end

    def new
        @purchaseOrder = PurchaseOrder.new quantity: 1,
                                           coin: Coin.find(params[:coin_id])
        @purchaseOrder.coin.price = CoinsController.fetch_price(@purchaseOrder.coin.symbol)
        @coin = @purchaseOrder.coin
    end

    def create
        #puts params[:coin].inspect
        @purchaseOrder = PurchaseOrder.new(params.require(:purchaseOrder).permit(:quantity))
        coin = Coin.find(params[:coin][:id].to_f);
        coin.price = params[:coin][:price].to_f
        @purchaseOrder.coin = coin
        @purchaseOrder.pricePaid = @purchaseOrder.coin.price * @purchaseOrder.quantity
        if @purchaseOrder.save
            redirect_to @purchaseOrder
        else
            if coin.price == 0
                flash[:alert] = "Unnable to fetch coin price, please try again in a few minutes"
            else
                flash[:alert] = "You can't buy it for free ;)"
            end
            redirect_to action: "new",
                        coin_id: @purchaseOrder.coin.id
        end
    end

    def show
        @purchaseOrder = PurchaseOrder.find(params[:id])
        @purchaseOrder.priceNow = @purchaseOrder.quantity * CoinsController.fetch_price(@purchaseOrder.coin.symbol)
    end
end
