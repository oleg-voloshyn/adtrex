Rails.application.routes.draw do
  root to: 'jumpings#new'

  resources :jumpings
end
