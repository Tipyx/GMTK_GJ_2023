class_name MonsterData
extends Resource

enum Monsters {
	SPIDERS,
	SNAKES,
	CHILDS,
	CATS,
	ORKS,
	DWARVES,
	ELVES,
	CARNIVOROUS_PLANTS,
	WOLVES,
}

@export var type := Monsters.CATS
@export var img : Texture2D
