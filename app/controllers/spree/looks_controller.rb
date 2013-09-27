module Spree
  class LooksController < Spree::StoreController
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    helper 'spree/products'

    before_filter :load_lookbook

    respond_to :html

    def index
      @looks = @lookbook.looks.active
      respond_with(@looks)
    end

    def show
      @look = @lookbook.looks.find_by_permalink!(params[:id])
      return unless @look && @lookbook
      @look_products = @look.look_products
      @look_image = @look.look_images.first
      @tooltip = @look_image.try(:tooltip)
      @tooltip_locations = @tooltip.try(:locations) || []

      respond_with(@look)
    end

    private

      def load_lookbook
        @lookbook = Spree::Lookbook.find_by_permalink!(params[:lookbook_id])
      end
  end
end
