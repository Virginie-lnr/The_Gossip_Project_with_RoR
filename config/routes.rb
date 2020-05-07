Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

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