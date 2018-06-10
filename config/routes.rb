Rails.application.routes.draw do
  get 'coins/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :coins
  resources :purchase_orders
  root 'coins#index'
end
