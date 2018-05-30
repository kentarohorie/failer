Rails.application.routes.draw do
  resources :posts
  root 'posts#index'

  resources :users
  resources :posts
  resources :user_sessions
  resources :tags
end
