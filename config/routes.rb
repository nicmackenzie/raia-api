Rails.application.routes.draw do
  # Custom route for user registration
  post '/signup', to: 'users#create'
  post '/certificate-upload', to: 'leader_uploads#create'
  get '/me', to:'sessions#me'


  resources :users, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reviews, only: [:index, :show,:create,:destroy]
  resources :messages, only: [:show,:create,:destroy]
  resources :discussion_replies,only: [:index,:create]
  resources :discussions,only: [:index,:create,:destroy]
  
  resource :session, only: [:create, :destroy]

    # User routes
    resources :users, only: [:index, :show, :update, :destroy] do
      collection do
        get 'top_influencers'
        get 'find_by_username/:username', to: 'users#find_by_username', as: 'find_by_username'
        get 'leaders_in_my_county'
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
  
  # Routes for NewsAndUpdatesComments
  resources :news_and_update_comments

end


