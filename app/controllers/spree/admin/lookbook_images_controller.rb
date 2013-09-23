module Spree
  module Admin
    class LookbookImagesController < ResourceController
      before_filter :load_data

      create.before :set_viewable
      update.before :set_viewable
      destroy.before :destroy_before

      private

        def location_after_save
          admin_lookbook_lookbook_images_url(@lookbook)
        end

        def load_data
          @lookbook = Lookbook.find_by_permalink(params[:lookbook_id])
        end

        def set_viewable
          @lookbook_image.viewable_type = 'Spree::Lookbook'
          @lookbook_image.viewable_id = @lookbook.id
        end

        def destroy_before
          @viewable = @lookbook_image.viewable
        end

    end
  end
end
