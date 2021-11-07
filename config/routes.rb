Rails.application.routes.draw do
  root 'pages#index'

  get '/search', to: 'posts#search'

  namespace :api do
    namespace :v1 do
      resources :comments,  only: [:index, :show, :create, :destroy]
      resources :posts,  only: [:index, :show]
      resources :likes,  only: [:index, :create]
    end
  end
end
