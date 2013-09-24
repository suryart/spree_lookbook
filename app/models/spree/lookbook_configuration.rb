# More on Spree's preference configuration - http://guides.spreecommerce.com/preferences.html#site_wide_preferences
module Spree
  class LookbookConfiguration < Preferences::Configuration
    preference :admin_lookbook_collections_per_page, :integer, :default => 25
    preference :admin_lookbooks_per_page, :integer, :default => 25
    preference :lookbooks_per_page, :integer, :default => 25
    preference :paginate_lookbooks_per_page, :boolean, :default => true
    preference :admin_looks_per_page, :integer, :default => 25
    preference :looks_per_page, :integer, :default => 25
    preference :paginate_looks_per_page, :boolean, :default => true
  end
end
