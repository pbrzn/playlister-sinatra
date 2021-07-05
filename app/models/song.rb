class Song < ActiveRecord::Base
  include Slugable::InstanceMethods
  extend Slugable::ClassMethods

  has_one :artist
  has_many :genres, through: :song_genres
end
