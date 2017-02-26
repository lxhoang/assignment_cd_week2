Rails.application.routes.draw do
  get 'messages/show'

  resources :sessions, only: [:new, :create]

  resources :friendships

  resources :users
  
  root 'home#welcome'

  get 'users/inbox' => 'users#inbox'

  delete '/log_out' => 'sessions#destroy'

  resources :messages do
  	collection do
  		get :sent
  		get :received
  	end
  end
 
end
