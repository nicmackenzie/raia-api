Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :reviews, only: [:index]
  resources :messages
  resources :discussion_replies,only: [:index,:create]
  resources :discussions,only: [:index,:create]
  resources :users
end
