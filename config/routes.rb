Rails.application.routes.draw do
  
  
  get 'login', to: 'sessions#new', as: 'new_session'  
  post 'login', to: 'sessions#create', as: 'session'   
  get 'logout', to: 'sessions#destroy'
  
  resources :listings
  resources :crops_labels
  resources :crop_categories
  resources :crops
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  

  

  get "password_resets/new"
  get "password_resets/edit"
  
  get '/profile', to: 'users#profile', as: 'profile'

  
  root to: "home#index"
  #root "users#new"
  get "users/index"
  get "home/about"

  #login/logout routes
  
 
  #get "up" => "rails/health#show", as: :rails_health_check


end
