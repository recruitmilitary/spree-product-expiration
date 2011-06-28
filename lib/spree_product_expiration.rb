require 'spree_core'
require 'spree_product_expiration_hooks'

module SpreeProductExpiration
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      Product.send(:include, ProductExpiration)
      Admin::ProductsController.send(:include, ProductExpirationController)

      Admin::BaseHelper.class_eval do
        def link_to_restore(resource, options = {})
          link_to_with_icon('restore', t("restore"), restore_admin_product_url(resource))
        end
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
