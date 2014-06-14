Rails.application.routes.draw do
  root to: 'jumpings#index'

  resources :jumpings
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
end
