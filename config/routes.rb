Rails.application.routes.draw do

  scope "(:locale)", locale: /ua|ru/ do
    root to: 'welcome#index'

    resources :jumpings
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    resources :password_resets, except: [:index, :show, :destroy]
    resources :locations

    get '/signup', to: 'users#new'
    get '/signin', to: 'sessions#new'
    delete '/signout', to: 'sessions#destroy'
  end
end
