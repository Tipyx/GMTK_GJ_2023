class_name TraitData extends Resource

enum Traits {
	CLAUSTROPHOBIC,
	POLLEN_ALLERGY,
	PRESBYOPIC,
	FAST_RUNNER,
	HATES_HEAT,
	SKITTISH,
	AGILE,
	HOOKING,
	LIGHT_STEPS,
	SUPERNATURAL_HEARING,
	SURVIVAL,
	ACROPHOBIA,
	DISCRETION,
	CLUMSY,
	ANTROPOPHOBIC,
	ARACNOPHOBIA,
	OPHIOPHOBIA,
	HONEST,
	CHATTY,
	SKIPPER,
}

@export var type := Traits.ACROPHOBIA

@export var desc := ""

var name : String = Traits.keys()[type]

@export var double_negative : Array[Resource] = []
@export var simple_negative : Array[Resource] = []
@export var simple_positive : Array[Resource] = []
@export var double_positive : Array[Resource] = []
