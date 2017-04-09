Rails.application.routes.draw do
  devise_for :factories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders

  root to: 'orders#index'
end
