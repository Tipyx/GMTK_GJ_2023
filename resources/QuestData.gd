class_name QuestData
extends Resource

enum Quests {
	EXCAVATION,
	ESCORT,
	FIGHT,
	ROBBERY,
	DUNGEON,
	DELIVERY,
	PICKING,
	RESCUE,
}

@export var type := Quests.DELIVERY

var name_str : String = Quests.keys()[type].capitalize()
