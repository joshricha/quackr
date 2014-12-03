Rails.application.routes.draw do
  devise_for :users

  root 'pages#index'

  get '/questions/:status' => 'questions#index'

  resources :categories, :only => [:index]
  resources :questions, :only => [:edit, :update, :new, :create, :index]
end
