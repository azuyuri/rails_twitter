Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home' # => root_path
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new' #7.12
  post '/signup',  to: 'users#create' #7.26

  get    '/login',   to: 'sessions#new' #8.2 GET login_path
  post   '/login',   to: 'sessions#create' #8.2 POST login_path
  delete '/logout',  to: 'sessions#destroy' #8.2

  resources :users do #14.15
    member do
      get :following, :followers
    end
  end

  # resources :users #7.3
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update] #12.1
  resources :microposts,          only: [:create, :destroy] #13.30
  resources :relationships,       only: [:create, :destroy] #14.20
end
