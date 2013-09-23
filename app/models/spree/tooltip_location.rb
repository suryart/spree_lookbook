module Spree
  class TooltipLocation < ActiveRecord::Base
    belongs_to :tooltip
    attr_accessible :tooltip_id, :location_id, :description, :top, :left
  end
end