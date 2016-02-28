class Activity < ActiveRecord::Base

  before_save :before_save_activity
  def before_save_activity
      self.slug = self.title.parameterize
  end

  def to_param
    self.slug
  end

  def self.search(q)
    where('title ILIKE ?', "%#{q}%")
    where('description ILIKE ?', "%#{q}%")
  end
end
