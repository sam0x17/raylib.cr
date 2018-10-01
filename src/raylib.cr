require "./raylibc/*"
require "./raylib/*"

module RayLib
end

RayLibC.init_audio_device
RayLibC.close_audio_device

wave = RayLib::Wave.new("test.wav")
sound = wave.to_sound
sound.volume = 0.8
sound.pitch = 0.4
