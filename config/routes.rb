Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/1', as: 'rails_admin'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  get 'home/about'
  resources :categories
  resources :products
  resources :cart_items
  devise_for :users

end
