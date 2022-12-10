Rails.application.routes.draw do
  resources :users, only: [:index,:create]
  post '/login', to: "users#login"
  resources :contacts, only: [:index, :show, :update, :destroy]
  post '/contacts', to: "contacts#create"
end
