class RayLib::Sound
  getter data : RayLibC::Sound
  getter volume = 1.0
  getter pitch = 1.0

  def initialize(path : String)
    @data = RayLibC.load_sound(path)
  end

  def initialize(wave : Wave)
    @data = RayLibC.load_sound_from_wave(wave.data)
  end

  def initialize(wave : RayLibC::Wave)
    @data = RayLibC.load_sound_from_wave(wave)
  end

  def finalize
    RayLibC.unload_sound(@data)
  end

  def update(sound : Sound, data : Void*, samples_count : Int)
    RayLibC.update_sound(@data, data, samples_count)
  end

  def play
    RayLibC.play_sound(@data)
  end

  def pause
    RayLibC.pause_sound(@data)
  end

  def stop
    RayLibC.stop_sound(@data)
  end

  def resume
    RayLibC.resume_sound(@data)
  end

  def playing?
    RayLibC.sound_playing?(@data)
  end

  def volume=(volume)
    @volume = volume
    RayLibC.set_sound_volume(@data, @volume)
  end

  def pitch=(pitch)
    @pitch = pitch
    RayLibC.set_sound_pitch(@data, @pitch)
  end
end

class RayLib::Wave
  @data : RayLibC::Wave

  def initialize(path : String)
    @data = RayLibC.load_wave(path.to_unsafe)
  end

  def initialize(data : Void*, sample_count : Int, sample_rate : Int, sample_size : Int, channels : Int)
    @data = RayLibC.load_wave_ex(data, sample_count, sample_rate, sample_size, channels)
  end

  def initialize(wave : RayLibC::Wave)
    @data = wave
  end

  def to_sound
    Sound.new(@data)
  end

  def finalize
    RayLibC.unload_wave(@data)
  end

  def format(sample_rate : Int, sample_size : Int, channels : Int)
    RayLibC.wave_format(pointerof(@data), sample_rate, sample_size, channels)
  end

  def copy
    Wave.new(RayLibC.wave_copy(@data))
  end

  def crop(init_sample : Int, final_sample : Int)
    RayLibC.wave_crop(pointerof(@data), init_sample, final_sample)
  end

  def sample_count
    @data.sample_count
  end

  def sample_rate
    @data.sample_rate
  end

  def sample_size
    @data.sample_size
  end

  def channels
    @data.channels
  end

  def data
    @data.data
  end
end
