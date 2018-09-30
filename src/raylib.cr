require "./raylibc/*"
require "./raylib/*"

module RayLib
end

RayLibC.init_audio_device
RayLibC.close_audio_device

wave = RayLib::Wave.new("test.wave")
