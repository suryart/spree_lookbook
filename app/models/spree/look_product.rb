module Spree  
  class Spree::LookProduct < ActiveRecord::Base
    belongs_to :look, :class_name => Spree::Look
    belongs_to :product, :class_name => Spree::Product
    attr_accessible :look_id, :product_id, :position, :product_name

    delegate :product_name, :to => :product
    delegate :look_name, :to => :look

    validates :look_id, :product_id, :presence => true

    def product_name
      product.try(:name)
    end

    def product_name=(name)
      self.product.name ||= name if name.present?
    end
  end
end