extends Node

@onready var game_data : GameData = preload("res://resources/GameData.tres")

var main : Main = null

var current_level : Level = null

var currentGold := 0

var currentDay := 0

var sound_is_mute := false
