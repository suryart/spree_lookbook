module Spree
  module Admin
    class LookProductsController < ResourceController
      belongs_to 'spree/look', :find_by => :permalink
      prepend_before_filter :load_data

      def index
        @look_products = @look.look_products
        respond_with(@look_products)
      end

      private

        # def build_resource
        #   # load_data
        # end

        def load_resource
          @object = Spree::LookProduct.new
        end

        def location_after_save
          collection_url
        end

        def collection_url
          admin_lookbook_collection_lookbook_look_look_products_url(@lookbook_collection, @lookbook, @look.permalink)
        end

        def load_data
          @lookbook = Spree::Lookbook.find_by_permalink!(params[:lookbook_id])
          @lookbook_collection = @lookbook.collection
          @look = Spree::Look.find_by_permalink!(params[:look_id])
        end
    end
  end
end