Rails.application.routes.draw do
  devise_for :users
  # resources :posts

  root 'pages#index'

  resources :questions, :only => [:edit, :update, :new, :create, :index]
end
