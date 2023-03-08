require '../item'
class MusicAlbum < Item
  attr_reader :on_spotify, :id

  def initialize(publish_date, on_spotify)
    @on_spotify = on_spotify
    super(publish_date)
  end

  private
end
