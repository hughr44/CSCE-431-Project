Rails.application.routes.draw do
  get 'dashboard/show'
    root 'home#show'
    get 'home/show'
    get 'login' => 'user#login'
    get 'dashboard' => 'dashboard#show'
    get 'auth/auth0/callback' => 'auth0#callback'
    get 'auth/failure' => 'auth0#failure'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
