class_name TitleScreen extends Node2D

@onready var play_button := $PlayButton

@onready var screen_selector := $OptionButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(_on_play_button_pressed)
	
	screen_selector.item_selected.connect(_on_screen_selector_item_clicked)

func _on_play_button_pressed():
	Global.main.new_game()
	SoundManager.play_sound(preload("res://sounds/sfxs/buttonClick.wav"))
	pass

func _on_screen_selector_item_clicked(index:int):
	if index == 0:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif index == 1:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
