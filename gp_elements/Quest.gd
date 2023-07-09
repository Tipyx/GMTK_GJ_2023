class_name Quest extends Node2D

enum Quest_Type {
	Excavation,
	Escort,
	Fight,
	Robbery,
	Dungeon,
	Delivery,
	Picking,
	Rescue
}

enum Quest_Environment {
	Cave,
	Forest,
	Desert,
	Mountain,
	Jungle,
	Swamp,
	Sea,
	Volcano
}

enum Quest_Monster {
	Spiders,
	Snakes,
	Childs,
	Cats,
	Orks,
	Dwarves,
	Elves,
	CarnivorousPlants,
	Wolves
}

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

var quest_type := Quest_Type.Delivery
var quest_enviro := Quest_Environment.Cave
var quest_monster := Quest_Monster.Spiders

func quest_type_name()->String :return Quest_Type.find_key(quest_type)
func quest_enviro_name()->String : return Quest_Environment.find_key(quest_enviro)
func quest_monster_name()->String : return Quest_Monster.find_key(quest_monster)

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
		quest_type = Quest_Type.values()[randi() % Quest_Type.size()]
		quest_enviro = Quest_Environment.values()[randi() % Quest_Environment.size()]
		quest_monster = Quest_Monster.values()[randi() % Quest_Monster.size()]
		var ca = Global.game_data.charac_class_attribute[c.charac_class_name()] as Dictionary
		var cs = Global.game_data.charac_specie_attribute[c.charac_specie_name()] as Dictionary
		var ct = Global.game_data.charac_trait_attribute[c.charac_trait_name()] as Dictionary
		current_score = 0
		if ca.has(quest_type_name()):
			current_score += ca[quest_type_name()]
		if ca.has(quest_enviro_name()):
			current_score += ca[quest_enviro_name()]
		if ca.has(quest_monster_name()):
			current_score += ca[quest_monster_name()]
		if cs.has(quest_type_name()):
			current_score += cs[quest_type_name()]
		if cs.has(quest_enviro_name()):
			current_score += cs[quest_enviro_name()]
		if cs.has(quest_monster_name()):
			current_score += cs[quest_monster_name()]
		if ct.has(quest_type_name()):
			current_score += ct[quest_type_name()]
		if ct.has(quest_enviro_name()):
			current_score += ct[quest_enviro_name()]
		if ct.has(quest_monster_name()):
			current_score += ct[quest_monster_name()]
	for md in monsterDatas:
		if md.type == quest_monster:
			monster_stamp.texture = md.img
	for md in enviroDatas:
		if md.type == quest_enviro:
			biome_stamp.texture = md.img
	type_label.text = quest_type_name().replace("_", " ")
	
	gold_value = randi_range(200, 400) + score * 30
	gold_label.text = str(gold_value)
