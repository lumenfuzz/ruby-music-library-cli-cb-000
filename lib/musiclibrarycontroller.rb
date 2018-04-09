class MusicLibraryController
  attr_accessor :importer

  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = nil
    until input == "exit"
      input = gets.chomp
    end
  end

  def list_songs

    name_list = []
    Song.all.each do |song|
      name_list << song.name
    end
    name_list.sort!
    binding.pry

    i = 0
    name_list.each do |name|
      i+= 1
      song = Song.find_by_name(name)
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end

  end

end
