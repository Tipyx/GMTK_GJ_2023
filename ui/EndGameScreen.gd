class_name EndGameScreen extends Node2D

@onready var label := $Label
@onready var button := $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.currentGold >= 4000:
		label.text = "Wut wut wut! You already won {gold} gold. You are the boss (in every sens of the word). Keep it this way, you will soon be wealthy (and retired).".format({"gold":Global.currentGold})
	elif Global.currentGold >= 2000:
		label.text = "{gold} gold. That's not perfect, but it's only your first week. Keep improving, and you will learn how to become a wealthy millionaire.".format({"gold":Global.currentGold})
	elif Global.currentGold > 0:
		label.text = "You earned only {gold} gold but the first step is always the hardest. You will become better. Let's hope so, or Quest Agency will soon go out of business.".format({"gold":Global.currentGold})
	else:
		label.text = "The point of running a business is not to lose money, right? Because we lost {gold} gold in your first week. It's bankrupt time. We have to close our door, not it's your turn to beg for a job! You should cross the road to find another job; King Camron said it works like that.".format({"gold":Global.currentGold})
	
	button.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
	Global.main.go_to_title_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
