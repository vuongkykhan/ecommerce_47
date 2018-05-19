Rails.application.routes.draw do
  get "sessions/new"
  root "static_pages#home"
  get "/contact", to: "static_pages#contact"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/show", to: "static_pages#show"
  get "/cart", to: "static_pages#cart"
  get "/signup", to: "customers#new"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  resources :customers
  resources :categories
end
