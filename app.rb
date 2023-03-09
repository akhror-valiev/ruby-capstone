require 'fileutils'
require 'json'
require_relative './classes/book_service'
require_relative './classes/game_service'

class App

    def initialize
        @books = BookService.new
        @games = GameService.new
        @items = []
    end

    
  def data(directory, filename)
    FileUtils.mkdir_p(directory)
    file_path = "./#{directory}/#{filename}"
    File.exist?(file_path) && JSON.parse(File.read(file_path))
  end

  def store_data
    File.write('./storage/genres.json', JSON.pretty_generate(@genres))
  end

  def list_data(option)
    case option
    when '1'
      @books.list
    when '2'
      @games.list
    when '3'
      @books.label_list
    when '4'
      @games.authors_list
    end
  end

  def add_data(option)
    case option
    when '9'
      @books.create
    when '10'
      album_data = @client.album_info
      music_album = MusicAlbum.new(album_data['publish_date'], album_data['on_spotify'])
      @music_albums << music_album.to_hash

      album_data['genre_name'].nil? && return

      genre = Genre.new(album_data['genre_name'])
      genre.add_item(music_album)
      @genres << genre.to_hash
    when '12'
      @games.create
    end
    puts 'successfully added'
  end

end