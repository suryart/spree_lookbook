Deface::Override.new( :name => "admin_lookbook_tab",
                      :virtual_path => "spree/layouts/admin",
                      :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                      :text => "<%= tab :lookbooks, :looks, :look_images, :lookbook_images, :icon => 'icon-book' %>")