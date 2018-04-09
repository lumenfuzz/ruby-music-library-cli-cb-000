require 'pry'

class Song
  extend Memorable::ClassMethods, Concerns::Findable
  include Memorable::InstanceMethods

  @@all = []
  attr_accessor :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    super
    self.artist= artist if artist != nil
    self.genre= genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end

  def self.new_from_filename(filename)
  file_data = filename.split(" - ")
  song_data = file_data[1].scan(/[^\.]+/)
  song = self.new(song_data[0], file_data[0])
  return song
end


def self.create_from_filename(filename)
  song = self.new
  file_data = filename.split(" - ")
  song_data = file_data[1].scan(/[^\.]+/)
  song.name = song_data[0]
  song.artist_name = file_data[0]
  self.all << song
  return song
end

end
