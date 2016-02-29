class Activity < ActiveRecord::Base

  acts_as_taggable_on :tags

  before_save :before_save_activity
  def before_save_activity
      self.slug = self.title.parameterize
  end

  def to_param
    self.slug
  end

  def self.search(query)
    queries = query.split.map {|q| "%#{q}%"}
    wheres = queries.map do |q|
      "title ILIKE '#{q}' OR description ILIKE '#{q}'"
    end.flatten.join(' OR ')
    Activity.where(wheres)
  end
end
