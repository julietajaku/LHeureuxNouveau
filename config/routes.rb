Rails.application.routes.draw do
  get 'admin/show'

  resources :products do
    get :toggle_available, :on => :member
  end

  resources :weeks

  resources :recipes do
    get :add_to_panier, :on => :member
    get :remove_from_panier, :on => :member 
  end

  resources :paniers

  devise_for :users

  root 'recipes#index'

# Example of named route that can be invoked with purchase_url(id: product.id)
  # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  #get 'recipes/:id/add_to_panier' => 'recipes#add_to_panier', :as => 'add_to_panier'
  #get 'recipes/:id/remove_from_panier' => 'recipes#remove_from_panier', :as =>'remove_from_panier'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'


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
