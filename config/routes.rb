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
  resources :spots, only: [:index, :show]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]
  get 'posts/autocomplete_spot/:term' => 'posts#autocomplete_spot'
end


