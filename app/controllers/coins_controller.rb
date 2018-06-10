class CoinsController < ApplicationController
    def index
        @coins = Coin.all
        @coins.each do |coin|
            cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 10.minute)
            price = cache.fetch(coin.symbol) do
                response = RestClient.get 'https://min-api.cryptocompare.com/data/price', {params: {'fsym' => coin.symbol, 'tsyms' => 'USD'}}
                JSON.parse(response)['USD']
            end
            coin.price = price
        end
    end
    def show
        @coin = Coin.find(params[:id])
        cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 10.minute)
        price = cache.fetch(@coin.symbol) do
            response = RestClient.get 'https://min-api.cryptocompare.com/data/price', {params: {'fsym' => @coin.symbol, 'tsyms' => 'USD'}}
            JSON.parse(response)['USD']
        end
        @coin.price = price
    end
    def new
    end
end
