require 'test_helper'

describe Song do
  let(:song) { Song.new File.expand_path("Sufjan/05 Eugene.wav") }

  it "knows track length" do
    assert_in_delta 147, song.length, 0.5
  end

  it "can get an array of frames" do
    frames = song.frames(100)
    assert_equal 101, frames.count
  end

  it "knows the title" do
    assert_equal "05 Eugene.wav", song.title
  end
end
