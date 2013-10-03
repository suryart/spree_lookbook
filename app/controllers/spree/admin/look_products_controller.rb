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

        def location_after_save
          collection_url
        end

        def collection_url
          admin_lookbook_collection_lookbook_look_look_products_url(@lookbook_collection, @lookbook, @look)
        end

        def load_data
          @lookbook_collection = LookbookCollection.find_by_permalink!(params[:lookbook_collection_id])
          @lookbook = @lookbook_collection.lookbooks.find_by_permalink!(params[:lookbook_id])
          @look = @lookbook.looks.find_by_permalink!(params[:look_id])
        end
    end
  end
end