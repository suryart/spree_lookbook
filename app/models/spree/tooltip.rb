module Spree
  class Tooltip < ActiveRecord::Base
    belongs_to :tooltipable, :polymorphic => true
    has_many :locations, :class_name => 'Spree::TooltipLocation'
    
    attr_accessible :animation, :animationType, :animationBg, :button, :tooltipable_type, :tooltipable_id
  end
end