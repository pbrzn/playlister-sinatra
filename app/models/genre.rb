class Genre < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods
  
  has_many :artists
  has_many :songs, through: :song_genres
end
