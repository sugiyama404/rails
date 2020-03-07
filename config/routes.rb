# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tops#top'

  devise_for :users
  get 'pages/index'
  get 'pages/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'tops#top'

  get '/users', to: 'users#user'
  get '/users/:id/login', to: 'login#login'
  post '/users/:id/login', to: 'login#check'
  get '/users/reserved', to: 'login#reserved'
  delete '/users/logout', to: 'login#destroy'

  # login
  get '/users/reserved', to: 'login#reserved'
  get '/users/signin', to: 'login#signin'
  post '/users/create', to: 'login#create'
  post '/users/save', to: 'login#save'
end
