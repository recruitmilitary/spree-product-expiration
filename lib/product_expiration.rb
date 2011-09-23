module ProductExpiration
  def self.included(base)
    table_name = base.table_name
    base.named_scope :not_deleted, lambda { 
      { :conditions => ["(#{table_name}.deleted_at IS NULL OR #{table_name}.deleted_at > ?)", Time.now.utc.to_s(:db)] } 
    }
    base.class_eval do
      def deleted?
        deleted_at && deleted_at <= Time.now
      end
    end
  end
end
