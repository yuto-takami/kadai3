Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root to: 'homes#top'

  get 'home/about' => 'homes#about', as: 'homes'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  get '/search' => 'search#search'
end