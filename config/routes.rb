Spree::Core::Engine.routes.draw do
  # Add this extension's routes here
  namespace :admin do
    resources :lookbooks do
      resources :lookbook_images, :path => :images do
        post :update_positions,:on => :collection
        get :tooltip, :on => :member
      end
      resources :looks do
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
      get  :search, :on => :collection
    end
  end

  resources :lookbooks, :only => [:index, :show] do
    resources :looks, :only => [:show]
  end
end
