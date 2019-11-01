Rails.application.routes.draw do
  get 'dashboard/show'
  get 'home/show'
  root 'home#show'
  get 'dashboard' => 'dashboard#show'
    get 'user' => 'user#user'
    get 'auth/auth0/callback' => 'auth0#callback'
    get 'auth/failure' => 'auth0#failure'
    resources :user
    
    get 'event' => 'event#event'
    resources :event
    
    get 'event.:id' => 'event#show'
    resources :event
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
