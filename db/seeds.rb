# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Coin.create([
    {symbol: 'BTC', coinName: 'Bitcoin', imageUrl: '/media/19633/btc.png'},
    {symbol: 'ETH', coinName: 'Ethereum', imageUrl: '/media/20646/eth_logo.png'},
    {symbol: 'DASH', coinName: 'DigitalCash', imageUrl: '/media/20626/imageedit_27_4355944719.png'},
    {symbol: 'ZEC', coinName: 'ZCash', imageUrl: '/media/351360/zec.png'},
    {symbol: 'XMR', coinName: 'Monero', imageUrl: '/media/19969/xmr.png'},
    {symbol: 'LTC', coinName: 'Litecoin', imageUrl: '/media/19782/litecoin-logo.png'}])
