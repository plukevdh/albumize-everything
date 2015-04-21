require 'test_helper'

describe AlbumFiles do
  let(:files) { AlbumFiles.new('Sufjan') }

  it "gets an array of song paths" do
    assert_instance_of Array, files.paths
  end

  it "can list song files" do
    assert_equal "01 Death with Dignity.wav", files.titles.first
  end

  it "can return song objects" do
    assert_instance_of Song, files.songs.first
  end

  it "knows count" do
    assert_equal 11, files.count
  end

  it "can get a song by title" do
    song = files['06 Fourth of July.wav']

    assert_instance_of Song, song
    assert_equal "06 Fourth of July.wav", song.title
  end
end
