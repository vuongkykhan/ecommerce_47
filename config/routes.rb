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
  resources :users
  resources :categories, only: :index
  namespace :admin do
    resources :categories
    resources :products
  end
  resources :carts, only: :index
  get "add_cart/:id_product", to: "carts#add_cart", as: :add_cart
end
