Rails.application.routes.draw do
  devise_for :users, controllers: { passwords: 'passwords' }
  resources :users, only: [:show]
  resources :events
  resources :event_attendance, except: [:index]

  root 'events#index'
end
