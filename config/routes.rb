Rails.application.routes.draw do

  root 'home#welcome'

  resources :users

  # get 'users' => 'users#n' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
