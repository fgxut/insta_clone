# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %i[index show new create]
  resources :posts do
    resources :comments, shallow: true
    get :search, on: :collection
  end
  resources :likes, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  scope :mypage do
    resource :account, only: %i[edit update]
  end
end
