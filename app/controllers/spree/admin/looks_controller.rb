module Spree
  module Admin
    class LooksController < ResourceController
      belongs_to 'spree/lookbook', :find_by => :permalink
      before_filter :build_look_product, :only => [:new, :edit]
      before_filter :load_lookbook

      def index
        respond_with(collection)
      end

      def show
        session[:return_to] ||= request.referer
        redirect_to( :action => :edit )
      end

      def products
        search = Spree::Product.search(:name_cont => params[:name])
        render :json => search.result.map(&:name)
      end

      private

        def build_look_product
          @look_product = @look.look_products.build
        end

        def location_after_save
          edit_admin_lookbook_collection_lookbook_look_url(@lookbook_collection, @lookbook, @look)
        end

        def collection
          @collection ||= Look.where(:lookbook_id => parent.id).sort_by_position.page(params[:page]).per(Spree::LookbookConfig[:admin_looks_per_page])
        end

        def load_lookbook
          @lookbook_collection = LookbookCollection.find_by_permalink!(params[:lookbook_collection_id])
          @lookbook = @lookbook_collection.lookbooks.find_by_permalink!(params[:lookbook_id])
        end

      protected

        def find_resource
          Look.find_by_permalink!(params[:id])
        end
    end
  end
end
