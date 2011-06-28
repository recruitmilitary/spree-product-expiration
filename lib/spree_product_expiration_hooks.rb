class SpreeProductExpirationHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  insert_after :admin_product_form_right, 'admin/products/expiration'
  insert_before :admin_products_index_row_actions, 'admin/products/restore_link'
end
