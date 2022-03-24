Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'

  root 'tweets#index'  # 追加

  devise_for :users
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
