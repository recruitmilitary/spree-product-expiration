module ProductExpiration
  def self.included(base)
    base.named_scope :not_deleted, lambda { { :conditions => ["(deleted_at IS NULL OR deleted_at > ?)", Time.now.utc.to_s(:db)] } }
  end

  module ControllerMethods
    def self.included(base)
      base.send(:alias_method, :old_reject_unknown_object, :reject_unknown_object)
      base.send(:alias_method, :reject_unknown_object, :reject_unknown_object_with_expiration_support)
    end

    def reject_unknown_object_with_expiration_support
      # workaround to catch problems with loading errors for permalink ids (reconsider RC permalink hack elsewhere?)
      begin
        load_object
      rescue Exception => e
        @object = nil
      end
      the_object = instance_variable_get "@#{object_name}"
      the_object = nil if (the_object.respond_to?(:deleted_at) && the_object.deleted_at < Time.now)
      unless params[:id].blank? || the_object
        if self.respond_to? :object_missing
          self.object_missing(params[:id])
        else
          render_404(Exception.new("missing object in #{self.class.to_s}"))
        end
      end
      true
    end
  end
end
