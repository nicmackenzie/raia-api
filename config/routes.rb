Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'

  # Standard RESTful routes for users
  resources :users

  # Session routes for login and logout
  resource :session, only: [:create, :destroy]

  # ... any other routes ...
end
