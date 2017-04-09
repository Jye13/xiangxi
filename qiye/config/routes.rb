Rails.application.routes.draw do
  resources :product_items
  resources :items
  devise_for :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :workers do 
    member do 
      get :reset_password
      put :change_current_city
    end
  end
  resources :users
  resources :couriers
  resources :factories

  resources :roles

  resources :categories do 
    resources :products
    member do 
      get :prices
      post :init_prices
    end
  end

  resources :prices

  resources :price_rules

  resources :stations do 
    collection do 
      get :suggestion
    end
  end

  resources :regions do 
    collection do 
      get :search
    end
  end

  resources :addresses do 
    collection do 
      get :suggestion
    end
  end
  resources :cities

  resources :orders do 
    member do 
      post :paidan
    end
  end

  resources :waybills
end
