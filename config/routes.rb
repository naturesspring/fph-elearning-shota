Rails.application.routes.draw do
  root "home#index"
  get "/signup", to: "users#new"
  post "/login", to: "sessions#create"
  get "/login", to:"sessions#new"
  delete "/logout", to:"sessions#destroy"
  
  resources :users, except: :new
  resources :categories, only: :index
  

  namespace :admin do
    resources :categories do
     resources :words
   end 
  end
end
