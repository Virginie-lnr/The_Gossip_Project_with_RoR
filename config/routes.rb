Rails.application.routes.draw do

  # Session 
  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :sessions, only: [:new, :create]

  root to: 'gossips#index'

  get '/profile', to: 'users#edit', as: :profile
  patch '/profile', to: 'users#update'
  
  resources :users, only:  [:new, :create, :show, :edit, :update] do 
    member do 
      get 'confirm'
    end
  end

  resources :cities
  resources :users
  resources :gossips

  get '/welcome/:first_name', to: 'welcome#get_username'
  get '/contact', to: 'contact#info'
  get '/team', to: 'team#presentation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end 