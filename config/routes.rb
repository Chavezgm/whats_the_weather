Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do 
    namespace :v0 do
      get "/forecast", to: "forecast#forecast"
      post '/users', to: "users#create"
      post '/sessions', to: 'sessions#create'
      post '/road_trip', to: 'road_trips#create'
    end
  end

  namespace :api do
    namespace :v1 do
      get '/book-search', to: 'search#search_books'
      
      # Add more routes for version 1 API as needed
    end
  end



end
