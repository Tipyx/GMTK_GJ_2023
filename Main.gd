class_name Main extends Node

@onready var level_ps := preload("res://screens/Level.tscn")
@onready var title_screen_ps := preload("res://ui/TitleScreen.tscn")
@onready var end_day_screen_ps := preload("res://ui/EndDayScreen.tscn")
@onready var end_game_screen_ps := preload("res://ui/EndGameScreen.tscn")
@onready var tuto_screen_ps := preload("res://ui/TutoScreen.tscn")

@onready var scene_wrapper := $SceneWrapper
@onready var quit_button := $QuitButton

var title_screen : TitleScreen = null
var end_day_screen : EndDayScreen = null
var end_game_screen : EndGameScreen = null
var tuto_screen : TutoScreen = null

func _ready() -> void:
	Global.main = self
	
	quit_button.pressed.connect(_on_quit_button_pressed)
	
#	SoundManager.play_music()
	
	go_to_title_screen()
	
func _on_quit_button_pressed():
	get_tree().quit()
	
func clean():
	if Global.current_level:
		Global.current_level.queue_free()
		Global.current_level = null
		
	if title_screen:
		title_screen.queue_free()
		title_screen = null
	
	if end_day_screen:
		end_day_screen.queue_free()
		end_day_screen = null
	
	if end_game_screen:
		end_game_screen.queue_free()
		end_game_screen = null

func go_to_title_screen():
	clean()
	
	title_screen = title_screen_ps.instantiate()
	scene_wrapper.add_child(title_screen)

func new_game():
	clean()
	
	Global.currentGold = 0
	Global.currentDay = 0
	
	tuto_screen = tuto_screen_ps.instantiate()
	scene_wrapper.add_child(tuto_screen)
	
func next_level():
	clean()

	Global.current_level = level_ps.instantiate()
	scene_wrapper.add_child(Global.current_level)

func go_to_end_day_screen(day_gold:int, level_scores:Array[int]):
	clean()
	
	end_day_screen = end_day_screen_ps.instantiate()
	scene_wrapper.add_child(end_day_screen)
	end_day_screen.init(day_gold, level_scores)
	
func go_to_end_game_screen():
	clean()
	
	end_game_screen = end_game_screen_ps.instantiate()
	scene_wrapper.add_child(end_game_screen)
