Rails.application.routes.draw do
  # resources :posts

  resources :questions, :only => [:edit, :update, :new, :create, :index, :show]
end
