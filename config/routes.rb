Rails.application.routes.draw do

  resources :shelves
  resources :books
  resources :users

  root to: 'application#home'

  get 'login', to: 'authentication#login'

end
