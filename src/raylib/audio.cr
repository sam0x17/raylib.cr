class RayLib::Wave
  @data : RayLibC::Wave
  @path : String

  def initialize(path : String)
    @path = path
    @data = RayLibC.load_wave(@path.to_unsafe)
  end

  def initialize(data : Void*, sample_count : Int32, sample_rate : Int32, sample_size : Int32, channels : Int32)
    @path = ""
    @data = RayLibC.load_wave_ex(data, sample_count, sample_rate, sample_size, channels)
  end

  def initialize(wave : RayLibC::Wave)
    @data = wave
    @path = ""
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
