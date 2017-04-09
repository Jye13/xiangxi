Rails.application.routes.draw do

  devise_for :users
  
  resources :categories do 
    resources :products
  end

  resources :addresses do 
    collection do 
      get :suggestion
    end
  end

  resources :orders

  get '/home/user', to: 'home#user', as: 'user_home'

  root to: 'categories#index'
end
