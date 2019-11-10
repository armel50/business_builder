Rails.application.routes.draw do
  # resources :messages
  # resources :shared_files
  # resources :notifications
  # resources :chat_rooms
  # resources :goals
  resources :projects
  resources :businesses, only: [:show,:create,:update,:index]
  resources :departments, only: [:show]
  resources :users, only: [:index,:show,:create,:new,:edit,:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :businesses, only: [:index,:show,:new,:create,:update,:edit,:destroy]  
    resources :projects, only: [:index, :show, :new,:create,:update,:edit,:destroy]
    resources :chat_rooms, only: [:index, :show, :new,:create,:update,:edit,:destroy]
  end

    root "application#home"

  get "/logIn", to: "users#login"
  post "/logIn", to: "users#check_user_for_loggin"
  post "/users/new", to: "users#create"

  get "/logout", to: "users#logout"
  get '/auth/github/callback', to: "sessions#create_with_github"


#All the following routes are nested routes for the admin
  post '/businesses/:business_id/departments', to: "admin/departments#create"
  patch '/businesses/:business_id/departments', to: "admin/departments#update"
  delete '/businesses/:business_id/department/:id/delete', to: "admin/departments#destroy", as: :delete_business_department
  get '/businesses/:business_id/departments', to: "admin/departments#index", as: :admin_business_deparments
  get '/businesses/:business_id/department/:id/edit', to: "admin/departments#edit", as: :edit_admin_business_department
  get '/businesses/:business_id/departments/new', to: "admin/departments#new", as: :new_admin_business_department



  resources :department do
    resources :projects
    resources :chat_rooms
  end

  resources :project do
    resources :goals
  end
  resources :chat_rooms do
    resources :messages
  end

  mount ActionCable.server => "/cable"
  post "/businesses/:id/apply", to: "businesses#create_application"
  delete "/businesses/:id/apply", to: "businesses#destroy_application"

  get "/businesses/:id/view_applicants", to: "businesses#view_application"


  delete "/terminate/:id/:user_id", to: "businesses#terminate"

  post "/submit_check_goals/:project_id", to: "goals#check_goal"
  patch "/department/4/projects", to: "projects#update"
  get "/my_companies/:user_id", to: "businesses#index"

  post "/add/:applicant_id/departments/:id", to: "departments#add_applicants"
end
