class_name EnviroData
extends Resource

enum Biomes {
	CAVE,
	FOREST,
	DESERT,
	MOUNTAIN,
	JUNGLE,
	SWAMP,
	SEA,
	VOLCANO,
}

@export var type := Biomes.CAVE
@export var img : Texture2D
