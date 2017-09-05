Rails.application.routes.draw do
  get '/login', to: 'sessions#new' , as: "login"
  post '/login', to: "sessions#create"
  get '/logout', to: 'sessions#destroy', as: "logout"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :owners
  resources :products

  root 'sessions#new'
end
