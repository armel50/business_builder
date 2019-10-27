Rails.application.routes.draw do
  resources :shared_files
  resources :notifications
  resources :chat_rooms
  resources :goals
  resources :projects
  resources :businesses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   root "application#home"
end
