Rails.application.routes.draw do

  resources :shelves
  resources :books
  resources :users

  root to: 'authentication#authentication'

  post '/login', to: 'authentication#login'
  get '/logout', to: 'authentication#logout'

  get '/user/shelf', to: 'shelves#show'

end
