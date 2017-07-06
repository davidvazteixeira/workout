Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :exercises
  end

  resource :dashboard, only: [:index] do
    collection do
      post :search, to: 'dashboard#search'
    end
  end

  resources :friendships, only: [:show, :create, :destroy]

  root to: "dashboard#index"
end
