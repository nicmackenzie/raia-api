Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'

  resources :users, only: [:index, :show,:update,:destroy]
  resource :session, only: [:create, :destroy]

  # Routes for the Interest resource
  resources :interests
  resources :counties

  # Routes for Petitions
  resources :petitions
  # Routes for NewsAndUpdates
  resources :news_and_updates
  # Routes for Events
  resources :events
  # Routes for Tickets
  resources :tickets

  # ... any other routes ...
end