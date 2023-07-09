class_name TutoScreen extends Node2D

@onready var button := $NextButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	Global.main.next_level()
