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

  resources :messages do
    collection do
      get 'my_sent_messages/:user_id', to: 'messages#mySentMessages', as: :my_sent_messages
      get 'my_received_messages/:user_id', to: 'messages#myReceivedMessages', as: :my_received_messages
    end
  end

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
  resources :events do 
    collection do
      get 'by_range', to: 'events#by_range'
    end
  end
  # Routes for Tickets
  resources :tickets

  match '*unmatched', to: 'application#route_not_found', via: :all
end
  
