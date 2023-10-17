Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'
  post '/certificate-upload', to: 'leader_uploads#create'
  get '/me', to:'sessions#me'
  get 'users/not-following', to: 'users#not_following'
  get 'users/my-leaders', to: 'users#leaders'
  get 'users/:username', to: 'users#get_user_by_username'

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reviews, only: [:index,:show,:create,:destroy]
  resources :messages, only: [:show,:create,:destroy]
  resources :discussion_replies,only: [:index,:create]
  resources :discussions,only: [:index,:create,:destroy]
  resources :users, only: [:index, :show,:update,:destroy]
  resource :session, only: [:create, :destroy]

  # Routes for the Interest resource
  resources :interests
  resources :counties,only:[:index]

  # Routes for Petitions
  resources :petitions
  # Routes for NewsAndUpdates
  resources :news_and_updates
  # Routes for Events
  resources :events
  # Routes for Tickets
  resources :tickets
end
  
