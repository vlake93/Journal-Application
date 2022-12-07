Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :user do
    resources :category do
      resources :task
    end
  end  
  post '/user/:user_id/category' => 'category#create', as: 'create_category'
  get '/user/:user_id/category/:id' => 'category#show', as: 'show_category'
  # patch 'category/:id', to: 'category#update'
  post 'user/:user_id/category/:category_id/task' => 'task#create', as: "create_task"
  delete '/user/:user_id/category/:id' => 'category#destroy', as: "delete_category"
  delete '/user/:user_id/category/:category_id/task/:id' => 'task#destroy', as: "delete_task"
  patch '/user/:user_id/category/:category_id/task/:id' => 'task#update', as: "update_task"

  # Defines the root path route ("/")
    devise_for :users

    devise_scope :user do
      authenticated :user do
        root :to => 'home#index', as: :authenticated_root
      end
      unauthenticated :user do
        root :to => 'devise/sessions#new', as: :unauthenticated_root
      end
    end
end
