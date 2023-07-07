extends Node

@onready var music_player := $MusicPlayer

@export var music : AudioStream

func play_sound(sfx:AudioStream):
	var asp = AudioStreamPlayer.new()
	add_child(asp)
	asp.stream = sfx
	asp.play()
	await asp.finished
	asp.queue_free()
	
func play_music():
	music_player.stream = music
	music_player.play()
