Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'

  # Standard RESTful routes for users
  resources :users

  # Session routes for login and logout
  resource :session, only: [:create, :destroy]

  # Routes for the Interest resource
  resources :interests

  # ... any other routes ...
end

