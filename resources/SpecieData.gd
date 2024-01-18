class_name SpecieData extends Resource

enum Species {
	HUMAN,
	ORK,
	HALFLING,
	UNICORN,
	CAT,
	ELF,
	DWARF,
}

@export var type := Species.HUMAN

@export var hellos_sfx : Array[AudioStreamWAV]

@export var shadows_texture : Array[Texture2D]

var name : String = Species.keys()[type]

@export var double_negative : Array[Resource] = []
@export var simple_negative : Array[Resource] = []
@export var simple_positive : Array[Resource] = []
@export var double_positive : Array[Resource] = []
