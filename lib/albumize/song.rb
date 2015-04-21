require 'ruby-audio'

class Song
  def initialize(path)
    @path = path
  end

  def length
    audio_file.info.length
  end

  def title
    File.basename(@path)
  end

  def frames(width=nil)
    frames = []

    audio_file do |audio|
      width ||= 600

      frames_per_sample = (audio.info.frames.to_f / width.to_f).to_i
      sample = RubyAudio::Buffer.new("float", frames_per_sample, audio.info.channels)

      while(audio.read(sample)) > 0
        frames << peak(sample, audio.info.channels)
      end
    end

    frames
  end

  private

  def audio_file(&block)
    if block_given?
      RubyAudio::Sound.open(@path) do |sound|
        yield sound
      end
    else
      RubyAudio::Sound.open(@path)
    end
  end

  def peak(frames, channels=1)
    peak_frame = []
    (0..channels-1).each do |channel|
      peak_frame << channel_peak(frames, channel)
    end
    peak_frame
  end

  def channel_peak(frames, channel=0)
    max = frames.max do |frame|
      next if frame.nil?
      frame = Array(frame)
      frame[channel].abs
    end

    max[channel].abs
  end
end
