Rails.application.routes.draw do
  # post 'clips/save', to: 'clips#create'

  resources :clips
  post 'clips/delete', to: 'clips#delete'
  root 'clips#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
