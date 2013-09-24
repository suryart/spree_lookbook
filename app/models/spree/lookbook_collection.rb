# A lookbook colleciton contains many lookbooks
# For example: "Winter Collection", "Summer Collection"
module Spree
  class LookbookCollection < ActiveRecord::Base
    include SpreeLookbook::Lookable
    has_many :lookbooks, :dependent => :destroy, :order => "#{Spree::Lookbook.table_name}.position ASC"

    has_many :lookbook_collection_images, :as => :viewable, :dependent => :destroy, :order => 'position ASC'
  end
end