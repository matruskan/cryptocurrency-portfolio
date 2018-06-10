class CoinsController < ApplicationController
    def index
        @coins = Coin.all
    end
    def new
    end
end
