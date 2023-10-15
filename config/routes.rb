Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'
  post '/certificate-upload', to: 'leader_uploads#create'
  get '/me', to:'sessions#me'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reviews, only: [:index]
  resources :messages, only: [:show,:create,:destroy]
  resources :discussion_replies,only: [:index,:create]
  resources :discussions,only: [:index,:create,:destroy]
  resources :users, only: [:index]
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

end
 


