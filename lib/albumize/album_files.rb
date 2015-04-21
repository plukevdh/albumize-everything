class AlbumFiles
  extend Enumerable

  def initialize(path)
    @path = path
  end

  def paths
    Dir.glob(File.join(@path, "*"))
  end

  def titles
    paths.map {|path| File.basename(path) }
  end

  def songs
    paths.map {|path| create_song(path) }
  end

  def [](title)
    path = paths.find {|path| path.end_with? title }
    create_song(path)
  end

  def count
    paths.count
  end

  private

  def create_song(path)
    Song.new File.expand_path(path)
  end
end
