Rails.application.routes.draw do
  devise_for :users


  root 'pages#index'

  get '/questions/:status' => 'questions#status_category'

  resources :categories
  resources :questions, :only => [:edit, :update, :new, :create, :index]

end
