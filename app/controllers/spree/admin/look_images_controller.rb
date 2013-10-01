module Spree
  module Admin
    class LookImagesController < ResourceController
      before_filter :load_data
      before_filter :load_tooltip, :only => [:tooltip]

      create.before :set_viewable
      update.before :set_viewable
      destroy.before :destroy_before

      respond_to :html, :json

      def save_tooltip
        unless params[:tooltip].blank?
          @look_image.tooltip.present? ? @look_image.tooltip.update_attributes(params[:tooltip]) : (@look_image.tooltip = Spree::Tooltip.create(params[:tooltip]))
          add_tooltip_locations
        end
        if @look_image.tooltip.present?
          flash[:notice] = t('spree.lookbook.tooltip_locations.messages.success')
          respond_with(@look_image) do |format|
            format.json {render :json => @look_image.to_json }
          end
        else
          flash[:error] = t('spree.lookbook.tooltip_locations.messages.error')
          respond_with(@look_image) 
        end
      end

      private

        def location_after_save
          admin_lookbook_collection_lookbook_look_look_images_url(@lookbook_collection, @lookbook, @look)
        end

        def add_tooltip_locations
          @look_image.tooltip.locations.destroy_all
          unless params[:moreInfos].blank?
            params[:moreInfos][params[:id]].each do |k, v|
              @look_image.tooltip.locations.create(v)
            end
          end
        end

        def load_data
          @lookbook_collection = LookbookCollection.find_by_permalink!(params[:lookbook_collection_id])
          @lookbook = @lookbook_collection.lookbooks.find_by_permalink!(params[:lookbook_id])
          @look = @lookbook.looks.find_by_permalink!(params[:look_id])
        end

        def load_tooltip
          @tooltip = @look_image.tooltip
          @tooltip_locations = @tooltip.try(:locations) || []
        end

        def set_viewable
          @look_image.viewable_type = 'Spree::Look'
          @look_image.viewable_id = @look.id
        end

        def destroy_before
          @viewable = @look_image.viewable
        end
    end
  end
end
