Rails.application.routes.draw do
  resources :contacts
  resources :users, only: [:index, :create]
  post '/login', to: "users#login"
  resources :contacts, only: [:index, :show, :create, :update, :destroy]
end
