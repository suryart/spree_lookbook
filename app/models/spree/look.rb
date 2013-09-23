class Spree::Look < ActiveRecord::Base
  include SpreeLookbook::Lookable
  
  attr_accessible :spree_lookbook_id

  belongs_to :lookbook
  has_many :look_products, :dependent => :destroy, :order => "#{Spree::LookProduct.table_name}.position ASC"
  has_many :products, :through => :look_products, :order => "#{Spree::LookProduct.table_name}.position ASC"
  has_many :images, :as => :viewable, :class_name => Spree::LookImage, :dependent => :destroy, :order => 'position ASC'

  validates :lookbook, :presence => true
  validates :permalink, :presence => true, :uniqueness => true

  accepts_nested_attributes_for :look_products
end
