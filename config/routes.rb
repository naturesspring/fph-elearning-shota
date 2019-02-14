Rails.application.routes.draw do
  root "home#index"
  get "/signup", to: "users#new"
  post "/login", to: "sessions#create"
  get "/login", to:"sessions#new"
  delete "/logout", to:"sessions#destroy"
  
  resources :users, except: :new

  namespace :admin do
    resources :categories
  end
end
