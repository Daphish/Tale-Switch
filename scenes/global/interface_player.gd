extends AudioStreamPlayer2D

const interface_music = preload("res://assets/music/TaleSwitchInterfaces.mp3")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music and is_playing():
		return
	
	stream = music
	volume_db = volume
	play()
	
func _play_music_interface():
	_play_music(interface_music)
	
func _stop_music_interface():
	stop()
