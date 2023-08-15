Rails.application.routes.draw do
  get 'home/index'
  #resources :users, only: [:new, :create]
  #resources :sessions, only: [:new, :create, :destroy]
  resource :weather, only: [:new, :show], controller: 'weathers'
  root to: 'home#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
