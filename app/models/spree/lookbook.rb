class Spree::Lookbook < ActiveRecord::Base
  include SpreeLookbook::Lookable
  
  has_many :looks, :class_name => Spree::Look, :dependent => :destroy
  has_many :look_products, :through => :looks, :dependent => :destroy, :order => "#{Spree::LookProduct.table_name}.position ASC"
  has_many :products, :through => :look_products, :order => "#{Spree::LookProduct.table_name}.position ASC"
  belongs_to :collection, :class_name => Spree::LookbookCollection, :foreign_key => :lookbook_collection_id

  has_many :lookbook_images, :as => :viewable, :dependent => :destroy, :order => 'position ASC'
  
  validates :permalink, :presence => true, :uniqueness => true

  def self.config(&block)
    yield(Spree::LookbookConfig)
  end
end
