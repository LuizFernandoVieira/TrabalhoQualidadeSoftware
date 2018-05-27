Rails.application.routes.draw do

  resources :shelves
  resources :books
  resources :users
  resources :reviews

  root to: 'authentication#authentication'

  get '/home', to: 'home#index'

  post '/login', to: 'authentication#login'
  get '/logout', to: 'authentication#logout'

  get '/myshelf', to: 'my_shelf#index', as: 'myshelf'
  get '/myreviews', to: 'my_reviews#index', as: 'myreviews'
  get '/consultbooks', to: 'consult_books#index', as: 'consultbooks'

end
