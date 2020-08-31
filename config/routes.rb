Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  post 'create', to: "room#create"
  get 'join', to: "room#join"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
