Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  namespace :welcome do
    get :about
    get :intro
  end

  resources :users do
    get :registered, :on => :collection
    get :ratings

    resource :profile do
      get :edit_pricings
      post :update_pricings
      post :toggle_available

      get :complete, :on => :collection

      resources :tests do
        post :certify, :on => :collection
        post :submit
        get :complete
      end
    end
  end

  resources :profiles, :only => [:index, :show]

  resources :cases do
    get :suggestion
    post :submit_request

    resources :invitations, :only => [:create, :update, :destroy]
  end

  resources :messages

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
