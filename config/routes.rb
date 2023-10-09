Rails.application.routes.draw do
  resources :users, only: [:index, :show,:update,:destroy]
  resource :session, only: [:create, :destroy]

  # ... any other routes ...
  post 'sign-up', to: 'users#create'
end
