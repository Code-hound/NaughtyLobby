Rails.application.routes.draw do
  # get 'users/dashboard'
  # get 'meetings/create'
  # get 'meetings/destroy'
  # get 'votes/create'
  # get 'votes/destroy'
  # get 'reviews/index'
  # get 'reviews/show'
  # get 'reviews/new'
  # get 'reviews/create'
  # get 'politicians/index'
  # get 'politicians/show'
  # get 'politicians/search_by_name'
  devise_for :users
  root to: 'pages#home'
  get 'users/:id/edit', to: 'users#edit', as: :edit_user
  patch :dashboard, to: 'users#upload', as: :upload_photo
  patch 'users/:id', to: 'users#upload', as: :user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets, only: [:index]
  resources :politicians, only: [:index, :show] do
    member do
      get 'search_by_name', to: 'politicians#search_by_name'
    end

    resources :votes, only: [:new, :create]
    resources :meetings, only: [:new, :create]
    resources :reviews, only: [:index, :show, :new, :create]
  end

  get :dashboard, to: 'users#dashboard'

  delete 'meeting/:id', to: 'meetings#destroy', as: :meeting
  delete 'vote/:id', to: 'votes#destroy', as: :vote

end
