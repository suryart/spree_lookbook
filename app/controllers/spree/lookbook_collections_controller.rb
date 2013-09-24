module Spree
  class LookbookCollectionsController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    respond_to :html

    def index
      @lookbook_collections = Spree::LookbookCollection.active
      respond_with(@lookbook_collections)
    end

    def show
      @lookbook_collection = Spree::LookbookCollection.find_by_permalink!(params[:id])
      return unless @lookbook_collection
      @lookbooks = @lookbook_collection.lookbooks

      respond_with(@lookbook_collection)
    end
  end
end
