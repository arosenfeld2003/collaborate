Rails.application.routes.draw do

  resources :projects  do
    resources :members do
      delete 'unsubscribe'
    end
  end

  devise_for :users

  root 'welcome#index'

end
