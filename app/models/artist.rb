class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  # include Slugifiable::InstanceMethods
  # extend Slugifiable::ClassMethods

  def slug
    @slug = self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    self.all.find {|i| i.slug == slug }
  end
end
