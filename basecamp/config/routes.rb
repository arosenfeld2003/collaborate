Rails.application.routes.draw do

  resources :members
  resources :projects
  devise_for :users

  root 'welcome#index'

end
