Rails.application.routes.draw do
  devise_for :users
  get 'movies/index'
  root to: "movies#index"

  resources :movies, only: [:new,:create,:show,:edit,:update,:destroy]


end
