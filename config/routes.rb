Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'
  post '/certificate-upload', to: 'leader_uploads#create'
  get '/me', to:'sessions#me'
  patch '/session/set_uid/:id', to:'sessions#set_uid'


  # Defines the root path route ("/")
  # root "articles#index"
  resources :reviews, only: [:index,:show,:create,:destroy] do
    collection do
      get 'leader', to: 'reviews#by_leader'
    end
  end

  resources :messages, only: [:index, :show, :create, :destroy]
  resources :discussion_replies,only: [:index,:create]
  resources :discussions,only: [:index,:create,:destroy]

  resource :session, only: [:create, :destroy]

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
  resources :events do 
    collection do
      get 'by_range', to: 'events#by_range'
      post ':id/attend', to: 'event_attendees#create'
      get ':id/attendees', to: 'events#attendees'
    end
  end
  # Routes for Tickets
  resources :tickets

  match '*unmatched', to: 'application#route_not_found', via: :all
end



