Rails.application.routes.draw do
  
  root 'books#index'
  resources :books, only: [:index, :new, :create, :show] do
   resources :recommendations, only: [:new, :create]
  end
  
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check
end
