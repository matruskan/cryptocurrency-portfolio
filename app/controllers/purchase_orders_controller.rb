class PurchaseOrdersController < ApplicationController
    def index
        @purchaseOrders = PurchaseOrder.all
    end
    def new
    end
end
