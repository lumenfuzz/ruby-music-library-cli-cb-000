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

end
