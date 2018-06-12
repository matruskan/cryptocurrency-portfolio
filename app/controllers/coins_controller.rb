class CoinsController < ApplicationController

    def self.fetch_price(symbol)
        cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 10.minute)
        cache.fetch(symbol) do
            response = RestClient.get 'https://min-api.cryptocompare.com/data/price', {params: {'fsym' => symbol, 'tsyms' => 'USD'}}
            JSON.parse(response)['USD']
        end
    end

    def index
        @coins = Coin.all
        @coins.each do |coin|
            coin.price = CoinsController.fetch_price(coin.symbol)
        end
    end

    def show
        @coin = Coin.find(params[:id])
        @coin.price = CoinsController.fetch_price(@coin.symbol)
    end

    def new
    end
end
