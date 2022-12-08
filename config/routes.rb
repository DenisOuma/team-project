Rails.application.routes.draw do
  resources :contacts
  resources :users, only: [:index, :show]
  post '/users', to: "users#create"
 
end
