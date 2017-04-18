Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'
  #creates two names routes help_path := /help and help_url := www.localhost/help
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #adding following and followers actions to the Users controller
  #makes URL like users/1/following and users/1/followers
  resources :users do
    member do 
      get:following, :followers
      end    
  end
  resources :account_activations, only: [:edit]
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end