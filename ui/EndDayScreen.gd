class_name EndDayScreen extends Node2D

@onready var label := $Label
@onready var next_button := $Button
@onready var perfect_label := $PerfectLabel
@onready var middle_label := $MiddleLabel
@onready var bad_label := $BadLabel

var perfect_text = "It was a fantastic day, and you earned {gold} gold. It's a lot! Hang on, and you soon will not have to work again (lucky you)"
var middle_text = "You got {gold} gold today. Only people who work make mistakes. You still have some tips to learn, but I believe you."
var bad_text = "Oh, {gold} gold. It could be worse, right? Pull yourself together, and take notes about each failure. To make an error is human; pushing the same error is ork."
var very_bad_text = "The banker called. The total for today is {gold} gold. You have to call them back right away. But trust me, this is not the end, not yet."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_button.pressed.connect(_on_next_button_pressed)
	
func _on_next_button_pressed():
	Global.main.next_level()

func init(day_gold:int, level_scores:Array[int]):
	if day_gold > 700:
		label.text = perfect_text.format({"gold":day_gold})
	elif day_gold > 400:
		label.text = middle_text.format({"gold":day_gold})
	elif day_gold > 0:
		label.text = bad_text.format({"gold":day_gold})
	else:
		label.text = very_bad_text.format({"gold":day_gold})
		
	perfect_label.text = str(level_scores[0])
	middle_label.text = str(level_scores[1])
	bad_label.text = str(level_scores[2])

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
