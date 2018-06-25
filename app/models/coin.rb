class Coin < ApplicationRecord
    def price
        Rails.cache.fetch(symbol, expires_in: 5.minutes) do
            begin
                response = RestClient.get 'https://min-api.cryptocompare.com/data/price', {params: {'fsym' => symbol, 'tsyms' => 'USD'}}
                JSON.parse(response)['USD']
            rescue => e
                0
            end
        end
    end
end
