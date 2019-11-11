Rails.application.routes.draw do
  get 'login' => 'login#show'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  
  get 'user' => 'user#user'
  resources :user
  
  get 'event' => 'event#event'
  get 'event.:id' => 'event#show'
  resources :event
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
