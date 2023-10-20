Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'
  post '/certificate-upload', to: 'leader_uploads#create'
  get '/me', to:'sessions#me'
  patch '/session/set_uid/:id', to:'sessions#set_uid'


  resources :users, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reviews, only: [:index]
  resources :messages, only: [:show,:create,:destroy]
  resources :discussion_replies,only: [:index,:create]
  resources :discussions,only: [:index,:create,:destroy]
  resources :users, only: [:index, :show,:update,:destroy]
  resource :session, only: [:create, :destroy]
  resource :event_details, only:[:create,:show]

    # User routes
    resources :users, only: [:index, :show, :update, :destroy] do
      collection do
        get 'top_influencers'
        get 'find_by_username/:username', to: 'users#find_by_username', as: 'find_by_username'
        get 'leaders'
      end
  
      member do
        post 'follow', to: 'users#follow'
        delete 'unfollow', to: 'users#unfollow'
      end
    end
    
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

  match '*unmatched', to: 'application#route_not_found', via: :all
end
  
