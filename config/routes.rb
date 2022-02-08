Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :events, only: [:new, :show, :create, :index]

  root 'events#index'
end
