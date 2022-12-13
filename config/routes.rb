require 'sidekiq/web'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  # Defines the root path route ("/")
  # root "articles#index"
  root "weather#search"
  post "/api_data",to: "weather#api_data"

  resources :users , only: [:create]
  get "/unsubscribe",to:"users#unsubscribe"
end
