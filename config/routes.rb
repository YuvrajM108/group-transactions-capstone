Rails.application.routes.draw do
  resources :groups
  resources :projects
  devise_for :users# , :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  authenticated do
    root :to => "users#show", as: :authenticated
  end
  
  root :to => "groups#index"
end
