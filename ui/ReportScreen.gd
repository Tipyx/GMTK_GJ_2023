class_name ReportScreen extends Node2D

@onready var desc_label := $DescLabel
@onready var title_label := $TitleLabel

func init(c:Character, q:Quest):
	if c.job.type == JobData.Jobs.WARRIOR and q.biomeData.type == EnviroData.Biomes.SWAMP:
		desc_label.text = "Venturing deep into the swamp requires agility, wearing armour is not an advantage."
	elif c.job.type == JobData.Jobs.WARRIOR and q.questData.type == QuestData.Quests.ROBBERY:
		desc_label.text = "Robbery requires stealth. Have you ever see a warrior being inconspicuous?"
	elif c.job.type == JobData.Jobs.WARRIOR and q.biomeData.type == EnviroData.Biomes.CAVE:
		desc_label.text = "Bruenor Battlehammer, one of the most infamous warriors, died while exploring a cave some time ago. I think they are still traumatized by their sudden death..."
	elif c.job.type == JobData.Jobs.THIEF and q.biomeData.type == EnviroData.Biomes.DESERT:
		desc_label.text = "Thieves take advantage of their environment. They hide and are great climbers. Though, they can't hide under a grain of sand."
	elif c.job.type == JobData.Jobs.THIEF and q.monsterData.type == MonsterData.Monsters.CATS:
		desc_label.text = "Thieves and cats go together like horse and carriage. They share a passion for robbery & excavation."
	elif c.job.type == JobData.Jobs.THIEF and q.questData.type == QuestData.Quests.DELIVERY:
		desc_label.text = "Would you trust a thief to deliver a package in good hands?"
	elif c.job.type == JobData.Jobs.BARD and q.questData.type == QuestData.Quests.DUNGEON:
		desc_label.text = "Bards are the best companion not to die, but they have trouble handling a fight themselves."
	elif c.job.type == JobData.Jobs.BARD and q.questData.type == QuestData.Quests.FIGHT:
		desc_label.text = "Bards may not know how to fight, but they can make snakes dance."
	elif c.job.type == JobData.Jobs.SCHOLAR and q.questData.type == QuestData.Quests.DUNGEON:
		desc_label.text = "Scholars didn't learn much about dungeons, but they know all about cats' weak points."
	elif c.job.type == JobData.Jobs.SCHOLAR and q.questData.type == QuestData.Quests.FIGHT:
		desc_label.text = "\"The pen is mightier than the sword,\" said one famous Scholar. Since then, he has died in a fight."
	elif c.job.type == JobData.Jobs.SCHOLAR and q.questData.type == QuestData.Quests.ROBBERY:
		desc_label.text = "Scholars learn a lot during training, like flower recognition or meticulousness. How being mischievous is not part of it."
	elif c.job.type == JobData.Jobs.PEASANT and q.questData.type == QuestData.Quests.ROBBERY:
		desc_label.text = "There is an old rivalry between Thieves & Peasant, as the first one stole a lot of food during The Great Hunger."
	elif c.job.type == JobData.Jobs.PEASANT and q.monsterData.type == MonsterData.Monsters.CATS:
		desc_label.text = "After hundreds of years, Peasants learn a lot regarding reptiles & insects, but they are still clueless about cats."
	elif c.job.type == JobData.Jobs.DRUID and q.monsterData.type == MonsterData.Monsters.WOLVES:
		desc_label.text = "There is one thing that druids love more than anything else: animals. All of them."
	elif c.job.type == JobData.Jobs.DRUID and q.monsterData.type == MonsterData.Monsters.CATS:
		desc_label.text = "Druids are really great at two things: picking flowers & cuddle furred animal."
	elif c.job.type == JobData.Jobs.DRUID and q.monsterData.type == MonsterData.Monsters.SNAKES:
		desc_label.text = "Druids are good company, even for snakes."
	elif c.job.type == JobData.Jobs.DRUID and q.monsterData.type == MonsterData.Monsters.SPIDERS:
		desc_label.text = "Last time, I saw a druid who was bitten by a spider. He said thank you and asked people to call them Spiderdruid."
	elif c.specie.type == SpecieData.Species.HUMAN and q.monsterData.type == MonsterData.Monsters.CHILDS:
		desc_label.text = "Most humans think childs are the cutest thing in the world. Humans are weird."
	elif c.specie.type == SpecieData.Species.HUMAN and q.monsterData.type == MonsterData.Monsters.CATS:
		desc_label.text = "Cats learned to meow to touch humans. And it worked well."
	elif c.specie.type == SpecieData.Species.ORK and q.monsterData.type == MonsterData.Monsters.ORKS:
		desc_label.text = "Orks are almost all cousins, it's just one big family."
	elif c.specie.type == SpecieData.Species.ORK and q.biomeData.type == EnviroData.Biomes.DESERT:
		desc_label.text = "One of the biggest enemies of orks is the heat. Then it's Dwarfs. "
	elif c.specie.type == SpecieData.Species.ORK and q.biomeData.type == EnviroData.Biomes.SWAMP:
		desc_label.text = "Did you ever see an Ork walking into the mud? It's funny because they look so powerless, so they prefer mountains."
	elif c.specie.type == SpecieData.Species.ORK and q.questData.type == QuestData.Quests.ROBBERY:
		desc_label.text = "Orks are not well known for their discretion, which is inversely proportional to their fighting skills."
	elif c.specie.type == SpecieData.Species.HALFLING and q.questData.type == QuestData.Quests.DELIVERY:
		desc_label.text = "It's not easy to lift a package which is twice your weight."
	elif c.specie.type == SpecieData.Species.HALFLING and q.monsterData.type == MonsterData.Monsters.WOLVES:
		desc_label.text = "My grandpa told me that a Wolf's favourite meal is Halflings. Not sure if it's true though."
	elif c.specie.type == SpecieData.Species.HALFLING and q.monsterData.type == MonsterData.Monsters.CARNIVOROUS_PLANTS:
		desc_label.text = "A long time ago in a country far, far away, a Halfling prince had a passion for plants. At least, until one of them ate him."
	elif c.specie.type == SpecieData.Species.UNICORN and q.questData.type == QuestData.Quests.ROBBERY:
		desc_label.text = "Did you try to pick up something with a hoof? You can't, actually."
	elif c.specie.type == SpecieData.Species.UNICORN and q.biomeData.type == EnviroData.Biomes.SEA:
		desc_label.text = "Fire burns, water wets and unicorns sink."
	elif c.specie.type == SpecieData.Species.UNICORN and q.biomeData.type == EnviroData.Biomes.JUNGLE:
		desc_label.text = "Unicorns are way better at carrying people and objects than walking in the middle of creepers."
	elif c.specie.type == SpecieData.Species.UNICORN and q.biomeData.type == EnviroData.Biomes.CAVE:
		desc_label.text = "It's not easy for unicorns to evolve in tight spaces."
	elif c.specie.type == SpecieData.Species.CAT and q.monsterData.type == MonsterData.Monsters.CATS:
		desc_label.text = "Did you notice that cats were working together to bring chaos & desolation to our land?"
	elif c.specie.type == SpecieData.Species.CAT and q.biomeData.type == EnviroData.Biomes.SEA:
		desc_label.text = "If you want to scare away a cat, throw water."
	elif c.specie.type == SpecieData.Species.CAT and q.biomeData.type == EnviroData.Biomes.SWAMP:
		desc_label.text = "Cats hate water as much as they love children because they are too young to exercise caution."
	elif c.specie.type == SpecieData.Species.ELF and q.monsterData.type == MonsterData.Monsters.ELVES:
		desc_label.text = "For an elf, taking the life of another elf is inconceivable, but killing dwarves is almost their national sport."
	elif c.specie.type == SpecieData.Species.ELF and q.biomeData.type == EnviroData.Biomes.CAVE:
		desc_label.text = "Elf doesn't feel confident while going in the bowels of the earth. They instead prefer to stay in the forest."
	elif c.specie.type == SpecieData.Species.DWARF and q.monsterData.type == MonsterData.Monsters.DWARVES:
		desc_label.text = "While Dwarfs should fight against other dwarfs when they can fight Elves & Orcs?"
	elif c.specie.type == SpecieData.Species.DWARF and q.questData.type == QuestData.Quests.PICKING:
		desc_label.text = "Even though they are close to the ground, it's pretty painful for a Dwarf to bend over"
	elif c.specie.type == SpecieData.Species.DWARF and q.biomeData.type == EnviroData.Biomes.SEA:
		desc_label.text = "Dwarves are not sailors, they belong to rocks."
	elif c.specie.type == SpecieData.Species.DWARF and q.biomeData.type == EnviroData.Biomes.FOREST:
		desc_label.text = "Why would a dwarf decide to go into the forest when they can stay in a cave?"
	elif c.traitData.type == TraitData.Traits.CLAUSTROPHOBIC and q.biomeData.type == EnviroData.Biomes.CAVE:
		desc_label.text = "You sent a claustrophobic person into a cave. Do you need more information, boss?"
	elif c.traitData.type == TraitData.Traits.POLLEN_ALLERGY and q.biomeData.type == EnviroData.Biomes.FOREST:
		desc_label.text = "If I am correct, you could find flowers & trees in a forest. They both spread pollen."
	elif c.traitData.type == TraitData.Traits.POLLEN_ALLERGY and q.monsterData.type == MonsterData.Monsters.CARNIVOROUS_PLANTS:
		desc_label.text = "My cousin, who is a botanist, once told me some carnivorous plants could spread pollen as a defensive mechanism."
	elif c.traitData.type == TraitData.Traits.POLLEN_ALLERGY and q.questData.type == QuestData.Quests.PICKING:
		desc_label.text = "I am not sure someone allergic to plants is the best person to handle picking quests..."
	elif c.traitData.type == TraitData.Traits.PRESBYOPIC and q.questData.type == QuestData.Quests.PICKING:
		desc_label.text = "While collecting things, you need to be able to recognize them. Is that obvious?"
	elif c.traitData.type == TraitData.Traits.PRESBYOPIC and q.questData.type == QuestData.Quests.EXCAVATION:
		desc_label.text = "The bad thing about having vision problems, is that it makes it harder to find what you lost. The great thing is that cats can take advantage of their cuteness."
	elif c.traitData.type == TraitData.Traits.HONEST and q.questData.type == QuestData.Quests.ROBBERY:
		desc_label.text = "Even if they need money, asking people to fight against who they are and what they believe is just wrong."
	elif c.traitData.type == TraitData.Traits.HATES_HEAT and q.biomeData.type == EnviroData.Biomes.DESERT:
		desc_label.text = "The average temperature in the desert is 40 degrees. In Winter."
	elif c.traitData.type == TraitData.Traits.HATES_HEAT and q.biomeData.type == EnviroData.Biomes.VOLCANO:
		desc_label.text = "Guess what you can find near a Volcano? Molten lava."
	elif c.traitData.type == TraitData.Traits.SKITTISH and q.biomeData.type == EnviroData.Biomes.MOUNTAIN:
		desc_label.text = "I heard there is perpetual snow in the mountains."
	elif c.traitData.type == TraitData.Traits.SKITTISH and q.biomeData.type == EnviroData.Biomes.CAVE:
		desc_label.text = "An excellent point about caves is that the average temperature is always the same, winter or summer. It never goes higher than 15 degrees, even in smaller caves."
	elif c.traitData.type == TraitData.Traits.SUPERNATURAL_HEARING and q.monsterData.type == MonsterData.Monsters.CHILDS:
		desc_label.text = "I have average hearing and can't handle children's cries for more than two minutes. While supernatural hearing can be a blessing in a cave or against a sneaky companion, it's not always the case."
	elif c.traitData.type == TraitData.Traits.ACROPHOBIA and q.biomeData.type == EnviroData.Biomes.VOLCANO:
		desc_label.text = "Cliffs are very high near our volcanos."
	elif c.traitData.type == TraitData.Traits.ACROPHOBIA and q.biomeData.type == EnviroData.Biomes.MOUNTAIN:
		desc_label.text = "Should I explain why sending an acrophobic hero to the mountains was not your best idea?"
	elif c.traitData.type == TraitData.Traits.CLUMSY and q.questData.type == QuestData.Quests.ROBBERY:
		desc_label.text = "While robbing someone, you must be deft if you don't want to be caught."
	elif c.traitData.type == TraitData.Traits.CLUMSY and q.questData.type == QuestData.Quests.EXCAVATION:
		desc_label.text = "Finding the missing object is one thing, but being able to bring it all back is another."
	elif c.traitData.type == TraitData.Traits.CLUMSY and q.questData.type == QuestData.Quests.DELIVERY:
		desc_label.text = "Quest Agency is authorized by law to take care of packages containing dynamite. It's better to be careful with it; an accident can happen so quickly."
	elif c.traitData.type == TraitData.Traits.ANTROPOPHOBIC and q.questData.type == QuestData.Quests.RESCUE:
		desc_label.text = "Sometimes, rescuing someone is more manageable than resisting the temptation of making them disappear."
	elif c.traitData.type == TraitData.Traits.ANTROPOPHOBIC and q.questData.type == QuestData.Quests.ESCORT:
		desc_label.text = "Escorting someone requires spending time with them. A lot of time. Basically, all day long."
	elif c.traitData.type == TraitData.Traits.ARACNOPHOBIA and q.monsterData.type == MonsterData.Monsters.SPIDERS:
		desc_label.text = "The spider and the fly can't make a deal. Same with an arachnophobic."
	elif c.traitData.type == TraitData.Traits.OPHIOPHOBIA and q.monsterData.type == MonsterData.Monsters.SNAKES:
		desc_label.text = "It's not clever to send heroes to fight their biggest fear. But you are clever, aren't you?"
	elif c.traitData.type == TraitData.Traits.CHATTY and q.questData.type == QuestData.Quests.ESCORT:
		desc_label.text = "My uncle is so chatty that I would probably kill myself instead of spending a full day with him."
	elif q.score == 0:
		desc_label.text = "You have to take advantages of the quality of the unemployed hero!"
		
	if q.score > 0:
		desc_label.text = "Excellent, nothing to say!"
		var gold = q.gold_value
		Global.currentGold += gold
		title_label.text = "{name} nailed the {type} mission!".format({"name":c.complete_name, "type":q.questData.name_str})
		title_label.text += "\nCongrats & keep going! You will soon be rich."
		title_label.text += "\nYou won {gold} gold!".format({"gold":gold})
	elif q.score > -2:
		var gold = abs(q.gold_value / 2)
		Global.currentGold += gold
		title_label.text = "{name} partially accomplished the {type} quest.".format({"name":c.complete_name, "type":q.questData.name_str})
		title_label.text += "\nYou won 50% of the reward, {gold} gold.".format({"gold":gold})
	else:
		var gold = abs(q.gold_value / 2)
		Global.currentGold -= gold
		title_label.text = "{name} totally failed the {type} quest. They even may be dead.".format({"name":c.complete_name, "type":q.questData.name_str})
		title_label.text += "\nOur insurance is unhappy about it and requests us to pay {gold} gold.".format({"gold":gold})
	Global.current_level.update_gold()
