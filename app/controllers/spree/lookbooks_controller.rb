module Spree
  class LookbooksController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/products'

    respond_to :html

    def index
      @lookbooks = Spree::Lookbook.active
      respond_with(@lookbooks)
    end

    def show
      @lookbook_collection = LookbookCollection.find_by_permalink!(params[:lookbook_collection_id])
      @lookbook = @lookbook_collection.lookbooks.find_by_permalink!(params[:id])
      return unless @lookbook
      @looks = @lookbook.looks

      respond_with(@lookbook)
    end
  end
end
