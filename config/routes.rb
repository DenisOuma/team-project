Rails.application.routes.draw do
  resources :users, only: [:create]
  # post '/users', to: "users#create"
end
