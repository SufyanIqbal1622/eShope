Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/1', as: 'rails_admin'
  mount RailsAdmin::Engine => '/gaon', as: 'rails_admin'
  root 'home#index'
  get 'home/about'
  get '/search' => 'products#search', :as => 'search_product'
  resources :categories
  resources :products
  resources :cart_items
  devise_for :users
  resources :orders

end
