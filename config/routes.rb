Rails.application.routes.draw do
  root to: 'jumpings#index'

  resources :jumpings
end
