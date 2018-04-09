class MusicLibraryController

  def initialize(path=./db/mp3s)
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome"
    input = nil
    until input == "exit"
      puts "input?"
      input = gets.chomp
    end
  end

end
