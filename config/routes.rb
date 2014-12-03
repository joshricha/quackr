Rails.application.routes.draw do
  # resources :posts

  resources :categories, :only => [:index]
  resources :questions, :only => [:edit, :update, :new, :create, :index]
end
