Rails.application.routes.draw do
  root "home#index"
  get "/signup", to: "users#new"
  post "/login", to: "sessions#create"
  get "/login", to:"sessions#new"
  delete "/logout", to:"sessions#destroy"
  
  resources :users, except: :new
  resources :lessons
  resources :categories, only: :index do 
    resources :answers, only: [:new, :create]
  end
 
  namespace :admin do
    resources :categories do
     resources :words
      resources :users 
   end 
  end
end
