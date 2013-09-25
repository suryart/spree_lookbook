module Spree
  module Admin
    class LookbookCollectionImagesController < ResourceController
      belongs_to 'spree/lookbook_collection', :find_by => :permalink

      create.before :set_viewable
      update.before :set_viewable
      destroy.before :destroy_before

      private

        def location_after_save
          admin_lookbook_collection_lookbook_collection_images_url(@lookbook_collection)
        end

        def set_viewable
          @lookbook_collection_image.viewable_type = 'Spree::LookbookCollection'
          @lookbook_collection_image.viewable_id = @lookbook_collection.id
        end

        def destroy_before
          @viewable = @lookbook_collection_image.viewable
        end
    end
  end
end
