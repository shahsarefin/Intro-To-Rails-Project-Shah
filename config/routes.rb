Rails.application.routes.draw do
  get 'static_pages/about'
  get 'owners/index'
  root 'static_pages#home'
  get '/breeds', to: 'breeds#index', as: :breeds
  get 'breeds/:id', to: 'breeds#show', as: 'breed'
  get '/owners', to: 'owners#index', as: :owners
  get '/owners/:id', to: 'owners#show', as: :owner
  get '/about', to: 'static_pages#about', as: :about
  get '/contact', to: 'static_pages#contact', as: :contact
  post 'contact', to: 'static_pages#submit_contact'
end
