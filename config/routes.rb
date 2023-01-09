require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  devise_for :users
  mount Sidekiq::Web => '/sidekiq'

  resources :clips
  post 'clips/delete', to: 'clips#delete'
  root 'clips#index'

  post '/auth/:provider/callback', to: 'sessions#create'

end
