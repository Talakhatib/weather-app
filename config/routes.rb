Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "weather#search"
  post "/api_data",to: "weather#api_data"
  post "/list",to: "weather#list_search"
end
