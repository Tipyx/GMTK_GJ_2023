class_name Character extends Node

enum Charac_Class {
	Warrior,
	Thief,
	Bard,
	Scholar,
	Peasant,
	Druid
}

enum Charac_Specie {
	Human,
	Ork,
	Halfling,
	Unicorn,
	Cat,
	Elf,
	Dwarf
}

enum Charac_Trait {
	Claustrophobic,
	Pollen_Allergy,
	Prebyopic,
	Fast_Runner,
	Hates_Heat,
	Skittish,
	Agile,
	Hooking,
	Light_Steps,
	Supernatural_Hearing,
	Survival,
	Acrophobia,
	Discretion,
	Clumsy,
	Antropophobic,
	Aracnophobia,
	Ophiophobia,
	Honest,
	Chatty,
	Skipper,
}

var charac_class := Charac_Class.Warrior
var charac_specie := Charac_Specie.Cat
var charac_trait := Charac_Trait.Prebyopic

func charac_class_name()->String :return Charac_Class.find_key(charac_class)
func charac_specie_name()->String : return Charac_Specie.find_key(charac_specie)
func charac_trait_name()->String : return Charac_Trait.find_key(charac_trait)

var complete_name := ""

func _init() -> void:
	charac_class = Charac_Class.values()[randi() % Charac_Class.size()]
	charac_specie = Charac_Specie.values()[randi() % Charac_Specie.size()]
	charac_trait = Charac_Trait.values()[randi() % Charac_Trait.size()]
