Spree::Core::Engine.routes.draw do
  # Add this extension's routes here
  namespace :admin do
    resources :lookbook_collections do
      post :update_positions,:on => :collection
      resources :lookbook_collection_images, :path => :images do
        post :update_positions,:on => :collection
      end
      resources :lookbooks do
        post :update_positions,:on => :collection
        resources :lookbook_images, :path => :images do
          post :update_positions,:on => :collection
        end
        resources :looks do
          post :update_positions,:on => :collection
          resources :look_images, :path => :images do
            post :update_positions, :on => :collection
            member do
              get :tooltip
              post :save_tooltip
            end
          end
          resources :look_products, :path => :products, :only => [:index, :create, :destroy] do
            post :update_positions, :on => :collection
          end
        end
      end
      get  :search, :on => :collection
    end
  end

  resources :lookbook_collections, :only => [:index, :show], :path => :collections do
    resources :lookbooks, :only => [:index, :show] do
      resources :looks, :only => [:show]
    end
  end
end
