Rails.application.routes.draw do
  devise_for :users
  get 'movies/index'
  root to: "movies#index"

  resources :movies do
    resources :comments,only: [:create,:destroy]
    resources :likes,only: [:create]
    delete '/likes(.:format)',to: "likes#destroy"
    collection do
     get 'likes/show'
    end

    collection do
      get 'search'
    end
    
  end

  resources :users, only: [:show,:edit,:update]

  get 'chat/:id' => 'chats#show', as: 'chat'
  get '/chats', to: 'chats#index'
  resources :chats, only: [:create]

end
