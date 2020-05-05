Rails.application.routes.draw do
  get '/gossip', to: 'gossip#show'
  root to: 'home#show'
  get '/welcome/:first_name', to: 'welcome#get_username'
  get '/contact', to: 'contact#info'
  get '/team', to: 'team#presentation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
