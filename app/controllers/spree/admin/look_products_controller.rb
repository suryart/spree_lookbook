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

        def build_resource
          # load_data
        end

        def load_resource
          @object = Spree::LookProduct.new
        end

        def location_after_save
          collection_url
        end

        def collection_url
          admin_lookbook_look_look_products_url(@lookbook, @look)
        end

        def load_data
          @lookbook = Spree::Lookbook.where('permalink = :id or id = :id', { :id => params[:lookbook_id] }).first
          @look = Spree::Look.where('permalink = :id or id = :id', { :id => params[:look_id] }).first
        end
    end
  end
end