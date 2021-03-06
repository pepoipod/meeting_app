Rails.application.routes.draw do

  resources :comments
  resources :topics_labels
  resources :labels
  resources :pages_categories
  resources :categories
  resources :pages
  resources :meetings_topics
  get 'users/index'

  get 'users/show'

  root 'topics#index'

  resources :users_meetings

  resources :topics do
    member do
      get :edit_label
      get "add_label/:topic_id/:label_id" => :add_label
      get :remove_label

      post :toggle
      resources :comments
    end

    collection do
      get :show_archived
    end
  end

  resources :meetings do
    member do
      get :attendance
      get :absence
    end

    collection do
      get :show_archived
    end

    resources :comments
  end
  resources :topics
  resources :comments

  resources :pages do
    member do
      get :edit_category
      get "add_category/:page_id/:category_id" => :add_category
      get :remove_category
    end
  end
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
