Rails.application.routes.draw do
    get 'user' => 'user#user'
    resources :user
    
    get 'event' => 'event#event'
    resources :event
    
    get 'event.:id' => 'event#show'
    resources :event
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
