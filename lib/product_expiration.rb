module ProductExpiration
  def self.included(base)
    base.named_scope :not_deleted, lambda { { :conditions => ["(products.deleted_at IS NULL OR products.deleted_at > ?)", Time.now.utc.to_s(:db)] } }
    base.class_eval do
      def deleted?
        deleted_at && deleted_at <= Time.now
      end
    end
  end
end
module ProductExpirationController
  def restore
    load_object
    @product.deleted_at = nil
    
    if @product.save
      self.notice = I18n.t("notice_messages.product_restored")
    else
      self.notice = I18n.t("notice_messages.product_not_restored")
    end

    redirect_to edit_admin_product_url(@product)
  end
end
