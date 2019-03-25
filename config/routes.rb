Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users
  get 'users/save_follow' => 'users#save_follow', :as => :user_follow
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy]
  get 'search' => 'search#index'
end
