class Song < ActiveRecord::Base
  extend Slugable::ClassMethods
  include Slugable::InstanceMethods

  has_one :artist
  has_many :genres, through: :song_genres
end
