Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/1', as: 'rails_admin'
  mount RailsAdmin::Engine => '/gaon', as: 'rails_admin'
  root 'home#index'
  get 'home/about'

  resources :categories
  resources :products
  devise_for :users
  resources :orders
  resources :order_items

end
