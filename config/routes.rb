require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :clips

  post 'clips/delete', to: 'clips#delete'
  root 'clips#index'
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations' }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    post 'sign_in', :to => 'devise/sessions#create', :as => :create_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  # devise_for :users

  # Statics
  get '/privacy', :to => 'pages#privacypolicy'
  get '/tos',     :to => 'pages#termsofservice'
end
