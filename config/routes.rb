Rails.application.routes.draw do
  resources :gossips

  root to: 'home#show'

  #get '/gossips', to: 'gossips#show'
  get '/welcome/:first_name', to: 'welcome#get_username'
  get '/contact', to: 'contact#info'
  get '/team', to: 'team#presentation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
