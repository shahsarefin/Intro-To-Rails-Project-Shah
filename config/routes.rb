Rails.application.routes.draw do
  get 'owners/index'
  # route for the breeds index action
  root 'breeds#index'
  get '/breeds', to: 'breeds#index', as: :breeds
  #get '/owners', to: 'owners#index', as: :owners
end
