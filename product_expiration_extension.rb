# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class ProductExpirationExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/product_expiration"

  # Please use product_expiration/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end

  def activate
    Product.send(:include, ProductExpiration)

    Admin::ProductsController.send(:include, ProductExpirationController)

    Admin::BaseHelper.class_eval do
      def link_to_restore(resource, options = {})
        link_to_with_icon('restore', t("restore"), restore_admin_product_url(resource))
      end
    end

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
