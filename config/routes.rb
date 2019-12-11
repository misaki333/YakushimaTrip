Rails.application.routes.draw do
  # 管理者
  devise_for :admins
  namespace :admin do
  	resources :users, only: [:show, :edit, :update, :index, :destroy]
    resources :spots, only: [:new, :create, :show, :edit, :update, :index, :destroy]
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end

  # ユーザ
  root to: 'posts#index'
  devise_for :users
  resources :users, only: [:edit, :update, :show]
  get 'users/:id/exit' => 'users#exit', as: 'exit'
  get 'users/:id/mypage' => 'users#mypage', as: 'mypage'
end
