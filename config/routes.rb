Rails.application.routes.draw do
  resources :groups
  resources :projects
  devise_for :users# , :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "groups#index"
end
