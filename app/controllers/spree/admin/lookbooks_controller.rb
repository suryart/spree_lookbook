module Spree
  module Admin
    class LookbooksController < ResourceController
      belongs_to 'spree/lookbook_collection', :find_by => :permalink
      before_filter :load_lookbook_collection

      def index
        respond_with(@collection) do |format|
          format.html
          format.json { render :json => json_data }
        end
      end

      def show
        session[:return_to] ||= request.referer
        redirect_to( :action => :edit )
      end

      def search
        params[:q].blank? ? [] : @products = Spree::Product.limit(20).search(:name_cont => params[:q]).result
      end

      protected

        def find_resource
          Lookbook.find_by_permalink!(params[:id])
        end

        def location_after_save
          spree.edit_admin_lookbook_collection_lookbook_url(@lookbook_collection, @lookbook)
        end

        def collection
          @collection ||= Lookbook.where(:lookbook_collection_id => @lookbook_collection.id).sort_by_position.page(params[:page]).per(Spree::LookbookConfig[:admin_lookbooks_per_page])
        end

        def load_lookbook_collection
          @lookbook_collection = Spree::LookbookCollection.find_by_permalink!(params[:lookbook_collection_id])
        end
    end
  end
end
