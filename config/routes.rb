Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#index"

  resources :sessions
  resources :users
  resources :products
  resources :purchases
end