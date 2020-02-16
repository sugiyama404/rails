Rails.application.routes.draw do

  root :to => "tops#top"

  devise_for :users
  get 'pages/index'
  get 'pages/show'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'tops#top'

  
  get '/users', to: 'users#user'



end
