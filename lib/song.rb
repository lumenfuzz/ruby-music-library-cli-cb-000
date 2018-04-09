require 'pry'

class Song
  extend Memorable::ClassMethods
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

  def self.find_by_name(name)
  self.all.each do |song|
    return song if song.name == name
  end
  return nil
end

def self.find_or_create_by_name(name)
  song = self.find_by_name(name)
  return song if song != nil
  return self.create(name) if song == nil
end

end
