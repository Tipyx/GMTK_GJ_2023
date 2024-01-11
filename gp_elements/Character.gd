class_name Character extends Node

var job : JobData
var specie : SpecieData
var traitData : TraitData

var complete_name := ""

func _init() -> void:
	job = Global.game_data.jobDatas.pick_random()
	specie = Global.game_data.specieDatas.pick_random()
	traitData = Global.game_data.traitDatas.pick_random()
