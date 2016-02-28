class Activity < ActiveRecord::Base

  before_save :before_save_activity
  def before_save_activity
      self.slug = self.title.parameterize
  end

  def to_param
    self.slug
  end

  def self.search(q)
    query = "%#{q}%"
    title_match = arel_table[:title].matches(query)
    description_match = arel_table[:description].matches(query)
    where(title_match.or(description_match))
  end
end
