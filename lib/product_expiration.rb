module ProductExpiration
  def self.included(base)
    base.named_scope :not_deleted, lambda { { :conditions => ["(deleted_at IS NULL OR deleted_at > ?)", Time.now.utc.to_s(:db)] } }
  end
end
