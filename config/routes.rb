Blog::Application.routes.draw do
  
  resources :comments do
    member do
      get "edit", to: "comments#edit", as: "edit"
      get "delete", to: "comments#destroy", as: "delete"
      post "update",to: "comments#update", as: "update"
    end
    collection do
      get "show", to: "comments#show", as: "show"
    end
  end

  resources :users do
    member do
      get "edit"
      get "delete", to: "user#destroy", as: "delete"
      post "update"
    end
  end

  resources :articles do
    member do
      get "edit"
      get "delete", to: "articles#destroy", as: "delete"
      post "update"
    end
  end

  resources :friendships do
    member do
      get "block", to: "friendships#block", as: "block"
      get "delete", to: "friendships#destroy", as: "delete"
      get "make", to: "friendships#create", as: "make"

      get "accept", to: "friendships#accept", as: "accept"
      get "check", to: "friendships#check", as: "check"
    end
  end

  
  resources :sessions, only: [:new, :create, :destroy]
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'page/index'
  root to: 'page#index'

  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
