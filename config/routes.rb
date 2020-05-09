Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users
  
  get '/items', to: 'items#index'
  get '/items/new', to: 'items#new'
  post '/items', to: 'items#create'
  get '/items/:id/edit', to: 'items#edit'
  patch '/items/:id', to: 'items#update'
  delete '/items/:id', to: 'items#destroy'
  get '/items/:id', to: 'items#show'

  post '/users/guest_sign_in', to: 'users#new_guest'
  # devise_scope :user do
  #   post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  # end
end
