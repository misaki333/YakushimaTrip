Rails.application.routes.draw do
  # 管理者
  devise_for :admins
  namespace :admin do
  	resources :users, only: [:show, :edit, :update, :index, :destroy]
    resources :spots
    resources :posts, only: [:show, :edit, :update, :index, :destroy]
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end

  # ユーザ
  root to: 'spots#index'
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  get 'users/:id/exit' => 'users#exit', as: 'exit'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
  resources :spots, only: [:index, :show] do
    resource :likes, only: [:create, :destroy]
  end
  resources :likes, only: [:index]
  delete 'likes/destroy_all' => 'likes#destroy_all', as: 'destroy_all'
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'posts/autocomplete_spot/:term' => 'posts#autocomplete_spot'
  resources :plans, only: [:create, :index, :edit, :update, :destroy]
  get 'plans/autocomplete_spot/:term' => 'plans#autocomplete_spot'
end


