Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/gaon', as: 'rails_admin'
  # root 'home#index'
  get 'home/about'
  get '/search' => 'products#search', :as => 'search_product'
  root 'products#index'
  post 'order_items' => "order_items#create"
  post 'order/:id' => "order#show", as: "order"
  delete 'orders/:id' => "orders#destroy"
  post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"

  get 'order_items/:id' => "order_items#show", as: "order_item"
  delete 'order_items/:id' => "order_items#destroy"
  resources :categories
  resources :products
  devise_for :users
  resources :orders
  resources :order_items

end
