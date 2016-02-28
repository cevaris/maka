class Activity < ActiveRecord::Base
  before_save :before_save_activity
  def before_save_activity
    if self.slug.nil?
      self.slug = "#{SecureRandom.hex(5)}-#{self.title.parameterize}"
    end
  end
  def to_param
    self.slug
  end
end
