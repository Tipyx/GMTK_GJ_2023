extends Node

enum Sound_Status {
	All,
	Ambiant,
	Off
}

@onready var game_data : GameData = preload("res://resources/GameData.tres")

var main : Main = null

var current_level : Level = null

var currentGold := 0

var currentDay := 0

var sound_status := Sound_Status.All
