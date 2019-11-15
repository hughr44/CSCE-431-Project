Rails.application.routes.draw do
  get 'login' => 'login#show'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  
  get 'user' => 'user#show'
  delete 'user' => 'user#destroy'
  resources :user
  
  get 'event' => 'event#show'
  get 'event.:id' => 'event#fixme'
  resources :event
  
  get 'announcement' => 'announcement#show'
  get 'officer/announcement' => 'announcement#officer_show'
  post 'officer/announcement' => 'announcement#create'
  resources :announcement
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
