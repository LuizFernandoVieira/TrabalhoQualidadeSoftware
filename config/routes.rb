Rails.application.routes.draw do

  root to: 'authentication#authentication'

  get '/home', to: 'home#index'
  post '/login', to: 'authentication#login', as: 'login'
  get '/logout', to: 'authentication#logout', as: 'logout'
  get '/register', to: 'authentication#register', as: 'register'
  post '/new_user', to: 'authentication#new_user'
  get '/no_access', to: 'authentication#no_access'

  resources :books
  resources :reviews

  get '/consultbooks', to: 'consult_books#index', as: 'consultbooks'
  get '/consulttradebooks', to: 'consult_books#trade', as: 'consulttradebooks'
  get '/consultusers', to: 'users#consult_users', as: 'consultusers'

  namespace :admin do
    resources :shelves
    resources :books
    resources :users
    resources :reviews
  end

end
