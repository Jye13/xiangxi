Rails.application.routes.draw do
  devise_for :couriers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :waybills do 
    member do 
      put :yiqu
    end
  end

  root to: 'waybills#index'

  resources :waybills do
    resources :items
  end
end
