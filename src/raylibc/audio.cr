@[Link("raylib")]
lib RayLibC
  struct Wave
    sample_count : LibC::UInt
    sample_rate : LibC::UInt
    sample_size : LibC::UInt
    channels : LibC::UInt
    data : Void*
  end

  struct Sound
    source : LibC::UInt
    buffer : LibC::UInt
    format : LibC::Int
  end

  type Music = Void*

  fun init_audio_device = InitAudioDevice
  fun close_audio_device = CloseAudioDevice
  fun audio_device_ready? = IsAudioDeviceReady : Bool
  fun set_master_volume = SetMasterVolume(volume : LibC::Float)
  fun load_wave = LoadWave(file_name : LibC::Char*) : Wave
  fun load_wave = LoadWaveEx(data : Void*, sample_count : LibC::Int, sample_rate : LibC::Int, sample_size : LibC::Int, channels : LibC::Int) : Wave
  fun load_sound = LoadSound(file_name : LibC::Char*) : Sound
  fun load_sound = LoadSoundFromWave(wave : Wave) : Sound
  fun update_sound = UpdateSound(sound : Sound, data : Void*, samples_count : LibC::Int)
  fun unload_wave = UnloadWave(wave : Wave)
  fun unload_sound = UnloadSound(sound : Sound)
  fun play_sound = PlaySound(sound : Sound)
  fun pause_sound = PauseSound(sound : Sound)
  fun resume_sound = ResumeSound(sound : Sound)
  fun stop_sound = StopSound(sound : Sound)
  fun sound_playing? = IsSoundPlaying(sound : Sound) : Bool
  fun set_sound_volume = SetSoundVolume(sound : Sound, volume : LibC::Float)
  fun set_sound_pitch = SetSoundPitch(sound : Sound, pitch : LibC::Float)
  fun wave_format = WaveFormat(wave : Wave*, sample_rate : LibC::Int, sample_size : LibC::Int, channels : LibC::Int)
  fun wave_copy = WaveCopy(wave : Wave) : Wave
  fun wave_crop = WaveCrop(wave : Wave*, init_sample : LibC::Int, final_sample : LibC::Int)
  fun get_wave_data = GetWaveData(wave : Wave) : LibC::Float*
  fun load_music_stream = LoadMusicStream(file_name : LibC::Char*) : Music
  fun unload_music_stream = UnloadMusicStream(music : Music)
  fun play_music_stream = PlayMusicStream(music : Music)
  fun update_music_stream = UpdateMusicStream(music : Music)
  fun stop_music_stream = StopMusicStream(music : Music)
  fun pause_music_stream = PauseMusicStream(music : Music)
  fun resume_music_stream = ResumeMusicStream(music : Music)
  fun music_playing? = IsMusicPlaying(music : Music) : Bool
  fun set_music_volume = SetMusicVolume(music : Music, volume : LibC::Float)
  fun set_music_pitch = SetMusicPitch(music : Music, pitch : LibC::Float)
  fun set_music_loop_count = SetMusicLoopCount(music : Music, count : LibC::Float)
  fun get_music_time_length = GetMusicTimeLength(music : Music) : LibC::Float
  fun get_music_time_played = GetMusicTimePlayed(music : Music) : LibC::Float
end
