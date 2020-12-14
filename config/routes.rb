Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  post 'create', to: "room#create"
  get 'join', to: "room#join"
  post 'create_session', to: "session_users#create"
  get 'user_participate/:id',to: "session_users#user_participate", as: "user_participate"
  get 'join_session/:id', to:"session_users#join_session", as: "join_session"
  get 'participate/:id', to: "session_users#participate",as: "participate"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
