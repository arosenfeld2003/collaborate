Rails.application.routes.draw do

  resources :projects do
    resources :members
  end

  devise_for :users

  root 'welcome#index'

end
