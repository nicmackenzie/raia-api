Rails.application.routes.draw do
  resources :users
  resource :session, only: [:create, :destroy]

  # ... any other routes ...
end
