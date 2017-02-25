Rails.application.routes.draw do
  resources :sessions, only: [:new, :create]

  resources :users
  root 'home#welcome'

  delete '/log_out' => 'sessions#destroy'
 
end
