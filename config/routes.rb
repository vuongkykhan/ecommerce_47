Rails.application.routes.draw do
  get "sessions/new"
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/show", to: "static_pages#show"
  get "/signup", to: "users#new"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :users do
    member do
      resources :orders do
        resources :order_items, only: :index
      end
    end
  end
  resources :products do
    resources :orders
  end
  resources :categories, only: :index
  namespace :admin do
    resources :categories
    resources :products
    resources :orders, only: :index do
      resources :order_items, only: :index
    end
    put "approve/:id_order", to: "orders#approve", as: :approve
    put "reject/:id_order", to: "orders#reject", as: :reject
  end
  resources :carts, only: :index
  get "add_cart/:id_product", to: "carts#add_cart", as: :add_cart
  get "remove_cart/:id_product", to: "carts#remove_cart", as: :remove_cart
  put "update_hard_cart", to: "carts#update_hard_cart", as: :update_hard_cart
  put "orders/:id_order", to: "orders#cancel", as: :cancel
end
