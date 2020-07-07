Rails.application.routes.draw do

  resources :projects  do
    member do
      delete :delete_attachment
    end
    resources :members do
      delete 'unsubscribe'
    end
    resources :topics do
      resources :messages
    end
  end

  devise_for :users

  root 'welcome#index'

end
