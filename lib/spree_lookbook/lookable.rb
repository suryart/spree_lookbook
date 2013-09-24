require 'active_support/concern'

module SpreeLookbook
  module Lookable
    extend ActiveSupport::Concern

    included do
      attr_accessible :name, :permalink, :description, :active

      has_many :products, :through => :look_products

      before_validation :set_permalink

      validates :name, :permalink, :presence => true
      validates :permalink, :uniqueness => true

      scope :active, -> { where(:active => true) }
      scope :sort_by_position, -> { order('position ASC') }
    end

    # Creates permalink based on Stringex's .to_url method
    def set_permalink
      self.permalink = name.to_url if permalink.blank?
    end

    def to_param
      permalink.present? ? permalink : (permalink_was || name.to_s.to_url)
    end
  end
end