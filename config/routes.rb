Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create]
  post '/login', to: "auth#create"
  post '/users', to: "users#create"
  get '/profile', to: 'users#profile'
end
