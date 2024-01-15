class_name Quest extends Node2D

@export var monsterDatas : Array[MonsterData] = []
@export var enviroDatas : Array[EnviroData] = []

@onready var clickArea := $Area2D
@onready var bg := $BG
@onready var bg_selected_sprite := preload("res://assets/bg_quest_selected.png")
@onready var bg_unselected_sprite = bg.texture
@onready var monster_stamp := $MonsterStamp
@onready var biome_stamp := $BiomeStamp
@onready var type_label := $TypeLabel
@onready var gold_label := $GoldLabel

var questData : QuestData
var monsterData : MonsterData
var biomeData : EnviroData

var is_selected = false

var score := 0

var gold_value := 0

func _ready() -> void:
	clickArea.input_event.connect(_on_click)
	biome_stamp.rotation_degrees += randf_range(-30, 30)
	monster_stamp.rotation_degrees += randf_range(-20, 20)
	
func _on_click(_viewport, event:InputEvent, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		Events.quest_clicked.emit(self)
		
func select():
	is_selected = true
	bg.texture = bg_selected_sprite
	
func unselect():
	is_selected = false
	bg.texture = bg_unselected_sprite

func init(c:Character, wanted_score:int) -> void:
	score = wanted_score
	var current_score := 999
	while current_score != score:
		current_score = 0
		
		questData = Global.game_data.questDatas.pick_random()
		if c.job.double_negative.has(questData) || c.specie.double_negative.has(questData) || c.traitData.double_negative.has(questData):
			current_score -= 2
		if c.job.simple_negative.has(questData) || c.specie.simple_negative.has(questData) || c.traitData.simple_negative.has(questData):
			current_score -= 1
		if c.job.simple_positive.has(questData) || c.specie.simple_positive.has(questData) || c.traitData.simple_positive.has(questData):
			current_score += 1
		if c.job.double_positive.has(questData) || c.specie.double_positive.has(questData) || c.traitData.double_positive.has(questData):
			current_score += 2
		
		monsterData = Global.game_data.monsterDatas.pick_random()
		if c.job.double_negative.has(monsterData) || c.specie.double_negative.has(monsterData) || c.traitData.double_negative.has(monsterData):
			current_score -= 2
		if c.job.simple_negative.has(monsterData) || c.specie.simple_negative.has(monsterData) || c.traitData.simple_negative.has(monsterData):
			current_score -= 1
		if c.job.simple_positive.has(monsterData) || c.specie.simple_positive.has(monsterData) || c.traitData.simple_positive.has(monsterData):
			current_score += 1
		if c.job.double_positive.has(monsterData) || c.specie.double_positive.has(monsterData) || c.traitData.double_positive.has(monsterData):
			current_score += 2
		
		biomeData = Global.game_data.biomeDatas.pick_random()
		if c.job.double_negative.has(biomeData) || c.specie.double_negative.has(biomeData) || c.traitData.double_negative.has(biomeData):
			current_score -= 2
		if c.job.simple_negative.has(biomeData) || c.specie.simple_negative.has(biomeData) || c.traitData.simple_negative.has(biomeData):
			current_score -= 1
		if c.job.simple_positive.has(biomeData) || c.specie.simple_positive.has(biomeData) || c.traitData.simple_positive.has(biomeData):
			current_score += 1
		if c.job.double_positive.has(biomeData) || c.specie.double_positive.has(biomeData) || c.traitData.double_positive.has(biomeData):
			current_score += 2
		
	monster_stamp.texture = monsterData.img
	biome_stamp.texture = biomeData.img
	type_label.text = questData.name_str
	
	gold_value = randi_range(200, 400) + score * 30
	gold_label.text = str(gold_value)
