class Genre < ActiveRecord::Base
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods

  has_many :artists
  has_many :songs, through: :song_genres
end
