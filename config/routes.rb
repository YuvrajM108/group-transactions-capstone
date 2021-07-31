Rails.application.routes.draw do
  resources :groups
  resources :projects
  resources :grouped_projects
  devise_for :users

  authenticated do
    root :to => "users#show", as: :authenticated
  end
  
  root :to => "groups#index"
end
