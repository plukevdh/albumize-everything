require 'test_helper'

describe AlbumStats do
  let(:album) { AlbumFiles.new "Sufjan" }
  let(:stats) { AlbumStats.new(album) }

  it "can get longest song" do
    assert_in_delta 308, stats.longest.length, 0.5
  end

  it "can get shortest song" do
    assert_in_delta 147, stats.shortest.length, 0.5
  end

  it "can get a range for album longest to shortest" do
    assert_equal 146.90721088435373..307.6672108843537, stats.range
  end

  it "can calculate a song's ratio in relation to longest song" do
    song = album['05 Eugene.wav']
    assert_in_delta 0.52, stats.ratio(song), 0.1
  end
end
