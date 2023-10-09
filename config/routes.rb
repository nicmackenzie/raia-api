Rails.application.routes.draw do
  resources :users
  resource :session, only: [:create, :destroy]


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
