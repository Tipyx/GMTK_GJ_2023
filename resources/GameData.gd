class_name GameData extends Resource

const cc = Character.Charac_Class
const cs = Character.Charac_Specie
const ct = Character.Charac_Trait

const qe = Quest.Quest_Environment
const qt = Quest.Quest_Type
const qm = Quest.Quest_Monster

@export var charac_class_attribute = {
	"Warrior" : {
		"Swamp" : -2,
		"Robbery" : -2,
		"Cave" : -1,
		"Rescue" : 1,
		"Escort" : 1,
		"Fight" : 2,
		"Dungeon" : 2,
	},
	"Thief" : {
		"Desert" : -2,
		"Cats" : -2,
		"Delivery" : -1,
		"Mountain" : 1,
		"Picking" : 1,
		"Robbery" : 2,
		"Excavation" : 1,
	},
	"Bard" : {
		"Dungeon" : -2,
		"Fight" : -1,
		"Robbery" : 1,
		"Snakes" : 2,
	},
	"Scholar" : {
		"Dungeon" : -2,
		"Fight" : -2,
		"Robbery" : -1,
		"Picking" : 1,
		"Excavation" : 1,
		"Cats" : 2,
	},
	"Peasant" : {
		"Robbery" : -2,
		"Cats" : -1,
		"Snakes" : 1,
		"Spiders" : 1,
		"Picking" : 2,
	},
	"Druid" : {
		"Wolves" : -2,
		"Cats" : -2,
		"Snakes" : -1,
		"Spiders" : -1,
		"Rescue" : 1,
		"Escort" : 1,
		"Picking" : 2
	},
}
	
@export var charac_specie_attribute = {
	"Human" : {
		"Childs" : -2,
		"Cats" : -1,
		"Forest" : 1,
		"Sea": 2,
	},
	"Ork" : {
		"Orks" : -2,
		"Desert" : -2,
		"Swamp" : -1,
		"Robbery" : -1,
		"Dwarves" : 1,
		"Mountain" : 1,
		"Fight" : 2,
		"Dungeon" : 2,
	},
	"Halfling" : {
		"Delivery" : -2,
		"Wolves" : -1,
		"CarnivorousPlants" : -1,
		"Swamp" : 1,
		"Cave" : 1,
		"Forest" : 2,
		"Robbery" : 2,
	},
	"Unicorn" : {
		"Cave" : -2,
		"Robbery" : -2,
		"Sea" : -1,
		"Jungle" : -1,
		"Delivery" : 1,
		"Childs" : 2,
		"Escort" : 2,
	},
	"Cat" : {
		"Cats" : -2,
		"Sea" : -2,
		"Swamp" : -1,
		"Excavation" : 1,
		"Robbery" : 2,
		"Childs" : 2,
	},
	"Elf" : {
		"Elves" : -2,
		"Cave" : -1,
		"Delivery" : 1,
		"Forest" : 2,
		"Dwarves" : 2,
	},
	"Dwarf" : {
		"Dwarves" : -2,
		"Picking" : -2,
		"Forest" : -1,
		"Sea" : -1,
		"Cave" : 1,
		"Orks" : 1,
		"Mountain" : 2,
		"Elves" : 2,
	}
}

@export var charac_trait_attribute = {
	"Claustrophobic" : {
		"Cave" : -2,
	},
	"Pollen_Allergy" : {
		"Forest" : -2,
		"Picking" : -2,
		"CarnivorousPlants" : 1,
	},
	"Prebyopic" : {
		"Picking" : -2,
		"Excavation" : -2,
		"Cats" : 2,
	},
	"Honest" : {
		"Robbery" : -2,
		"Delivery" : 2,
	},
	"Fast_Runner" : {
		"Delivery" : 2,
	},
	"Hates_Heat" : {
		"Desert" : -2,
		"Volcano" : -2,
		"Mountain" : 2,
		"Cave" : 2,
	},
	"Skittish" : {
		"Mountain" : -2,
		"Cave" : -1,
		"Desert" : 2,
		"Volcano" : 2,
	},
	"Agile" : {
		"Swamp" : 1,
		"Jungle" : 1,
		"Robbery" : 2,
	},
	"Hooking" : {
		"Robbery" : 2,
	},
	"Light_Steps" : {
		"Robbery" : 2,
		"Swamp" : 2,
	},
	"Supernatural_Hearing" : {
		"Childs" : -2,
		"Cave" : 1,
		"Cats" : 2,
	},
	"Survival" : {
		"CarnivorousPlants" : 1,
		"Wolves" : 1,
		"Desert" : 2,
		"Jungle" : 2,
	},
	"Acrophobia" : {
		"Mountain" : -2,
		"Volcano" : -2,
	},
	"Discretion" : {
		"Cave" : 1,
		"Robbery" : 2,
	},
	"Clumsy" : {
		"Robbery" : -2,
		"Delivery" : -1,
		"Excavation" : -1,
	},
	"Antropophobic" : {
		"Rescue" : -2,
		"Escort" : -2,
		"Childs" : 2,
	},
	"Aracnophobia" : {
		"Spiders" : -2,
	},
	"Ophiophobia" : {
		"Snakes" : -2,
	},
	"Chatty" : {
		"Escort" : -2,
	},
	"Skipper" : {
		"Sea" : 2,
	},
}
