Rails.application.routes.draw do
  resources :shared_files
  resources :notifications
  resources :chat_rooms
  resources :goals
  resources :projects
  resources :businesses
  resources :users, only: [:index,:show,:create,:new,:edit,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "application#home"

  get "/logIn", to: "users#login"
  post "/logIn", to: "users#check_user_for_loggin"
  post "/users/new", to: "users#create"

  get "/logout", to: "users#logout"
  get '/auth/github/callback', to: "sessions#create_with_github"
end
