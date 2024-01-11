class_name JobData extends Resource

enum Jobs {
	WARRIOR,
	THIEF,
	BARD,
	SCHOLAR,
	PEASANT,
	DRUID,
}

@export var type := Jobs.BARD

var name : String = Jobs.keys()[type]

@export var double_negative : Array[Resource] = []
@export var simple_negative : Array[Resource] = []
@export var simple_positive : Array[Resource] = []
@export var double_positive : Array[Resource] = []
