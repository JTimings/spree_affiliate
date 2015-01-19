Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "affiliate_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:affiliates, :icon => 'icon-group') %>",
                     :disabled => false)