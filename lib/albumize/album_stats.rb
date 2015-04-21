class AlbumStats
  def initialize(album)
    @album = album
  end

  def longest
    @longest ||= length_stat :max
  end

  def shortest
    @shortest ||= length_stat :min
  end

  def range
    shortest.length..longest.length
  end

  def ratio(song)
    song.length / longest.length
  end

  private

  def length_stat(method)
    @album.songs.send(method) {|a,b| a.length <=> b.length }
  end
end
