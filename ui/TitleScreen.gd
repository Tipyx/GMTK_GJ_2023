class_name TitleScreen extends Node2D

@onready var play_button := $PlayButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(_on_play_button_pressed)

func _on_play_button_pressed():
	Global.main.new_game()
	SoundManager.play_sound(preload("res://sounds/sfxs/buttonClick.wav"))
	pass
