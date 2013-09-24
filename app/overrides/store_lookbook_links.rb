Deface::Override.new( :name => "store_lookbook_tab",
                      :virtual_path => "spree/shared/_main_nav_bar",
                      :insert_after => "#home-link[data-hook]",
                      :text => "<li><%= link_to t(:lookbooks), lookbook_collections_url %></li>")