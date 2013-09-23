module Spree
  module Admin
    class LookbooksController < ResourceController
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
          spree.edit_admin_lookbook_url(@lookbook)
        end

        def collection
          return @collection if @collection.present?
          @search = Spree::Lookbook.includes(:looks).ransack(params[:q])
          @collection = @search.result.page(params[:page]).per(Spree::LookbookConfig[:admin_lookbooks_per_page])
        end
    end
  end
end
