require 'sidekiq/web'

Rails.application.routes.draw do
  root 'pages#index'

  mount Sidekiq::Web => '/sidekiq'

  get '/search', to: 'posts#search'
  get '/import', to: 'pages#import'

  post '/import_date', to: 'pages#import_date'
  namespace :api do
    namespace :v1 do
      resources :comments,  only: [:index, :show, :create, :destroy]
      resources :posts,  only: [:index, :show]
      resources :likes,  only: [:index, :create]
    end
  end
end
