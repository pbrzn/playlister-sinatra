class Artist < ActiveRecord::Base
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods

  has_many :songs
  has_many :genres
end
