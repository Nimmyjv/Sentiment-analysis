Rails.application.routes.draw do
  resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'

  get 'homepage', to: 'homepage#index'
  get 'error', to: 'homepage#error'
  post 'get_tweets', to: 'homepage#get_tweets'
  end