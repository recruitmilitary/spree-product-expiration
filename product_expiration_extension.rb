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

    # make your helper avaliable in all views
    # Spree::BaseController.class_eval do
    #   helper YourHelper
    # end
  end
end
