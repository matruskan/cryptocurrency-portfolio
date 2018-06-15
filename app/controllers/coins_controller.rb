class CoinsController < ApplicationController

    def self.fetch_price(symbol)
        Rails.cache.fetch(symbol, expires_in: 5.minutes) do
            begin
                response = RestClient.get 'https://min-api.cryptocompare.com/data/price', {params: {'fsym' => symbol, 'tsyms' => 'USD'}}
                JSON.parse(response)['USD']
            rescue => e
                put = "Unable to fetch coin price"
                0
            end
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
