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
end