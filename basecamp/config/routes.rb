Rails.application.routes.draw do

  resources :projects do
    member do
      delete :delete_attachment
    end
    resources :members do
      delete 'unsubscribe'
    end
    resources :topics do
      resources :messages
    end
    resources :tasks do
      member do
        post :create_subtask, :edit_subtask
        post :task_list_item
        get :edit_subtask
        delete :edit_subtask
      end
    end
  end

  devise_for :users

  root 'welcome#index'

end
