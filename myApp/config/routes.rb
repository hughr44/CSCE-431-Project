Rails.application.routes.draw do
  get 'login' => 'login#show'
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  
  get '/' => 'user#home'
  get '/officer/user' => 'user#show'
  post '/officer/user' => 'user#create'
  delete 'user' => 'user#destroy'
  get 'officer' => 'user#officer'
  resources :user
  
  get 'event' => 'event#show'
  get 'event.:id' => 'event#fixme'
  resources :event
  
  get 'announcement' => 'announcement#show'
  get 'officer/announcement' => 'announcement#officer_show'
  post 'officer/announcement' => 'announcement#create'
  resources :announcement
  
  post 'users_events/' => 'users_events#create'
  delete 'users_events/'  => 'users_events#destroy'
  resources :users_events
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
