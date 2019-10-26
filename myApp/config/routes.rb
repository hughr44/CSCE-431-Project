Rails.application.routes.draw do
    get 'user' => 'user#user'
    get ‘auth/:provider/callback’, to: ‘sessions#googleAuth’
    get ‘auth/failure’, to: redirect(‘/’)
    resources :user
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
