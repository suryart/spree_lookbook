# Spree::product decorator
# A product can be included in many different looks.
#
module Spree
  Product.class_eval do
    has_many :look_products, :class_name => Spree::LookProduct, :dependent => :destroy
    has_many :looks, :through => :look_products
  end
end