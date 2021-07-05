class SongGenre < ActiveRecord::Base
  has_many :song_ids
  has_many :genre_ids
end
