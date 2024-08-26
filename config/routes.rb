Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  resources :sessions, only: :create
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  
  resources :wallet, only: :index

  get '/withdraw', to: 'transactions#withdraw_form'
  post '/withdraw', to: 'transaction#withdraw'
  get '/deposit', to: 'transactions#deposit_form'
  post '/deposit', to: 'transactions#deposit'
  get '/transfer', to: 'transactions#transfer_form'
  post '/transfer', to: 'transactions#transfer'
end
