Rails.application.routes.draw do
  get 'profiles/show'
  get 'votes/create'
  get 'votes/destroy'
  
  root 'books#index'
  resources :books, only: [:index, :new, :create, :show] do
   resources :recommendations, only: [:new, :create]
  end

  resources :recommendations, only: [] do
    resources :votes, only: [:create, :destroy]
  end

  resource :profile, only: :show
  
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check
end
