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
          edit_admin_lookbook_look_url(@lookbook.permalink, @look)
        end

        def collection
          @collection ||= Look.where(:lookbook_id => parent.id)
        end

        def load_lookbook
          @lookbook = Spree::Lookbook.find_by_permalink!(params[:lookbook_id])
        end

      protected

        def find_resource
          Look.find_by_permalink!(params[:id])
        end
    end
  end
end
