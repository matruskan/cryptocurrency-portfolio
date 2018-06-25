class PurchaseOrdersController < ApplicationController
    def index
        @purchaseOrders = PurchaseOrder.all
    end

    def new
        @purchaseOrder = PurchaseOrder.new quantity: 1,
                                           coin: Coin.find(params[:coin_id])
        @coin = @purchaseOrder.coin
    end

    def create
        #puts params[:coin].inspect
        @purchaseOrder = PurchaseOrder.new(params.require(:purchaseOrder).permit(:quantity))
        coin = Coin.find(params[:coin][:id]);
        @purchaseOrder.coin = coin
        @purchaseOrder.pricePaid = @purchaseOrder.priceNow
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
    end
end
