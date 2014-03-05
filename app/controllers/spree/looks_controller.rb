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
      @look_image = @look.images.first
      load_tooltip_locations if @look_image

      respond_with(@look)
    end

    private

      def load_tooltip_locations
        @tooltip = @look_image.tooltip
        @tooltip_locations = @tooltip.try(:locations) || []
      end

      def load_lookbook
        @lookbook = Spree::Lookbook.find_by_permalink!(params[:lookbook_id])
      end
  end
end
