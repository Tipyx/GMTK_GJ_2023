class_name ReportScreen extends Node2D

@onready var desc_label := $DescLabel
@onready var title_label := $TitleLabel

func init(c:Character, q:Quest):
	if c.charac_class == Character.Charac_Class.Warrior and q.quest_enviro == Quest.Quest_Environment.Swamp:
		desc_label.text = "Venturing deep into the swamp requires agility, wearing armour is not an advantage."
	elif c.charac_class == Character.Charac_Class.Warrior and q.quest_type == Quest.Quest_Type.Robbery:
		desc_label.text = "Robbery requires stealth. Have you ever see a warrior being inconspicuous?"
	elif c.charac_class == Character.Charac_Class.Warrior and q.quest_enviro == Quest.Quest_Environment.Cave:
		desc_label.text = "Bruenor Battlehammer, one of the most infamous warriors, died while exploring a cave some time ago. I think they are still traumatized by their sudden death..."
	elif c.charac_class == Character.Charac_Class.Thief and q.quest_enviro == Quest.Quest_Environment.Desert:
		desc_label.text = "Thieves take advantage of their environment. They hide and are great climbers. Though, they can't hide under a grain of sand."
	elif c.charac_class == Character.Charac_Class.Thief and q.quest_monster == Quest.Quest_Monster.Cats:
		desc_label.text = "Thieves and cats go together like horse and carriage. They share a passion for robbery & excavation."
	elif c.charac_class == Character.Charac_Class.Thief and q.quest_type == Quest.Quest_Type.Delivery:
		desc_label.text = "Would you trust a thief to deliver a package in good hands?"
	elif c.charac_class == Character.Charac_Class.Bard and q.quest_type == Quest.Quest_Type.Dungeon:
		desc_label.text = "Bards are the best companion not to die, but they have trouble handling a fight themselves."
	elif c.charac_class == Character.Charac_Class.Bard and q.quest_type == Quest.Quest_Type.Fight:
		desc_label.text = "Bards may not know how to fight, but they can make snakes dance."
	elif c.charac_class == Character.Charac_Class.Scholar and q.quest_type == Quest.Quest_Type.Dungeon:
		desc_label.text = "Scholars didn't learn much about dungeons, but they know all about cats' weak points."
	elif c.charac_class == Character.Charac_Class.Scholar and q.quest_type == Quest.Quest_Type.Fight:
		desc_label.text = "\"The pen is mightier than the sword,\" said one famous Scholar. Since then, he has died in a fight."
	elif c.charac_class == Character.Charac_Class.Scholar and q.quest_type == Quest.Quest_Type.Robbery:
		desc_label.text = "Scholars learn a lot during training, like flower recognition or meticulousness. How being mischievous is not part of it."
	elif c.charac_class == Character.Charac_Class.Peasant and q.quest_type == Quest.Quest_Type.Robbery:
		desc_label.text = "There is an old rivalry between Thieves & Peasant, as the first one stole a lot of food during The Great Hunger."
	elif c.charac_class == Character.Charac_Class.Peasant and q.quest_monster == Quest.Quest_Monster.Cats:
		desc_label.text = "After hundreds of years, Peasants learn a lot regarding reptiles & insects, but they are still clueless about cats."
	elif c.charac_class == Character.Charac_Class.Druid and q.quest_monster == Quest.Quest_Monster.Wolves:
		desc_label.text = "There is one thing that druids love more than anything else: animals. All of them."
	elif c.charac_class == Character.Charac_Class.Druid and q.quest_monster == Quest.Quest_Monster.Cats:
		desc_label.text = "Druids are really great at two things: picking flowers & cuddle furred animal."
	elif c.charac_class == Character.Charac_Class.Druid and q.quest_monster == Quest.Quest_Monster.Snakes:
		desc_label.text = "Druids are good company, even for snakes."
	elif c.charac_class == Character.Charac_Class.Druid and q.quest_monster == Quest.Quest_Monster.Spiders:
		desc_label.text = "Last time, I saw a druid who was bitten by a spider. He said thank you and asked people to call them Spiderdruid."
	elif c.charac_specie == Character.Charac_Specie.Human and q.quest_monster == Quest.Quest_Monster.Childs:
		desc_label.text = "Most humans think childs are the cutest thing in the world. Humans are weird."
	elif c.charac_specie == Character.Charac_Specie.Human and q.quest_monster == Quest.Quest_Monster.Cats:
		desc_label.text = "Cats learned to meow to touch humans. And it worked well."
	elif c.charac_specie == Character.Charac_Specie.Ork and q.quest_monster == Quest.Quest_Monster.Orks:
		desc_label.text = "Orks are almost all cousins, it's just one big family."
	elif c.charac_specie == Character.Charac_Specie.Ork and q.quest_enviro == Quest.Quest_Environment.Desert:
		desc_label.text = "One of the biggest enemies of orks is the heat. Then it's Dwarfs. "
	elif c.charac_specie == Character.Charac_Specie.Ork and q.quest_enviro == Quest.Quest_Environment.Swamp:
		desc_label.text = "Did you ever see an Ork walking into the mud? It's funny because they look so powerless, so they prefer mountains."
	elif c.charac_specie == Character.Charac_Specie.Ork and q.quest_type == Quest.Quest_Type.Robbery:
		desc_label.text = "Orks are not well known for their discretion, which is inversely proportional to their fighting skills."
	elif c.charac_specie == Character.Charac_Specie.Halfling and q.quest_type == Quest.Quest_Type.Delivery:
		desc_label.text = "It's not easy to lift a package which is twice your weight."
	elif c.charac_specie == Character.Charac_Specie.Halfling and q.quest_monster == Quest.Quest_Monster.Wolves:
		desc_label.text = "My grandpa told me that a Wolf's favourite meal is Halflings. Not sure if it's true though."
	elif c.charac_specie == Character.Charac_Specie.Halfling and q.quest_monster == Quest.Quest_Monster.CarnivorousPlants:
		desc_label.text = "A long time ago in a country far, far away, a Halfling prince had a passion for plants. At least, until one of them ate him."
	elif c.charac_specie == Character.Charac_Specie.Unicorn and q.quest_type == Quest.Quest_Type.Robbery:
		desc_label.text = "Did you try to pick up something with a hoof? You can't, actually."
	elif c.charac_specie == Character.Charac_Specie.Unicorn and q.quest_enviro == Quest.Quest_Environment.Sea:
		desc_label.text = "Fire burns, water wets and unicorns sink."
	elif c.charac_specie == Character.Charac_Specie.Unicorn and q.quest_enviro == Quest.Quest_Environment.Jungle:
		desc_label.text = "Unicorns are way better at carrying people and objects than walking in the middle of creepers."
	elif c.charac_specie == Character.Charac_Specie.Unicorn and q.quest_enviro == Quest.Quest_Environment.Cave:
		desc_label.text = "It's not easy for unicorns to evolve in tight spaces."
	elif c.charac_specie == Character.Charac_Specie.Cat and q.quest_monster == Quest.Quest_Monster.Cats:
		desc_label.text = "Did you notice that cats were working together to bring chaos & desolation to our land?"
	elif c.charac_specie == Character.Charac_Specie.Cat and q.quest_enviro == Quest.Quest_Environment.Sea:
		desc_label.text = "If you want to scare away a cat, throw water."
	elif c.charac_specie == Character.Charac_Specie.Cat and q.quest_enviro == Quest.Quest_Environment.Swamp:
		desc_label.text = "Cats hate water as much as they love children because they are too young to exercise caution."
	elif c.charac_specie == Character.Charac_Specie.Elf and q.quest_monster == Quest.Quest_Monster.Elves:
		desc_label.text = "For an elf, taking the life of another elf is inconceivable, but killing dwarves is almost their national sport."
	elif c.charac_specie == Character.Charac_Specie.Elf and q.quest_enviro == Quest.Quest_Environment.Cave:
		desc_label.text = "Elf doesn't feel confident while going in the bowels of the earth. They instead prefer to stay in the forest."
	elif c.charac_specie == Character.Charac_Specie.Dwarf and q.quest_monster == Quest.Quest_Monster.Dwarves:
		desc_label.text = "While Dwarfs should fight against other dwarfs when they can fight Elves & Orcs?"
	elif c.charac_specie == Character.Charac_Specie.Dwarf and q.quest_type == Quest.Quest_Type.Picking:
		desc_label.text = "Even though they are close to the ground, it's pretty painful for a Dwarf to bend over"
	elif c.charac_specie == Character.Charac_Specie.Dwarf and q.quest_enviro == Quest.Quest_Environment.Sea:
		desc_label.text = "Dwarves are not sailors, they belong to rocks."
	elif c.charac_specie == Character.Charac_Specie.Dwarf and q.quest_enviro == Quest.Quest_Environment.Forest:
		desc_label.text = "Why would a dwarf decide to go into the forest when they can stay in a cave?"
	elif c.charac_trait == Character.Charac_Trait.Claustrophobic and q.quest_enviro == Quest.Quest_Environment.Cave:
		desc_label.text = "You sent a claustrophobic person into a cave. Do you need more information, boss?"
	elif c.charac_trait == Character.Charac_Trait.Pollen_Allergy and q.quest_enviro == Quest.Quest_Environment.Forest:
		desc_label.text = "If I am correct, you could find flowers & trees in a forest. They both spread pollen."
	elif c.charac_trait == Character.Charac_Trait.Pollen_Allergy and q.quest_monster == Quest.Quest_Monster.CarnivorousPlants:
		desc_label.text = "My cousin, who is a botanist, once told me some carnivorous plants could spread pollen as a defensive mechanism."
	elif c.charac_trait == Character.Charac_Trait.Pollen_Allergy and q.quest_type == Quest.Quest_Type.Picking:
		desc_label.text = "I am not sure someone allergic to plants is the best person to handle picking quests..."
	elif c.charac_trait == Character.Charac_Trait.Prebyopic and q.quest_type == Quest.Quest_Type.Picking:
		desc_label.text = "While collecting things, you need to be able to recognize them. Is that obvious?"
	elif c.charac_trait == Character.Charac_Trait.Prebyopic and q.quest_type == Quest.Quest_Type.Excavation:
		desc_label.text = "The bad thing about having vision problems, is that it makes it harder to find what you lost. The great thing is that cats can take advantage of their cuteness."
	elif c.charac_trait == Character.Charac_Trait.Honest and q.quest_type == Quest.Quest_Type.Robbery:
		desc_label.text = "Even if they need money, asking people to fight against who they are and what they believe is just wrong."
	elif c.charac_trait == Character.Charac_Trait.Hates_Heat and q.quest_enviro == Quest.Quest_Environment.Desert:
		desc_label.text = "The average temperature in the desert is 40 degrees. In Winter."
	elif c.charac_trait == Character.Charac_Trait.Hates_Heat and q.quest_enviro == Quest.Quest_Environment.Volcano:
		desc_label.text = "Guess what you can find near a Volcano? Molten lava."
	elif c.charac_trait == Character.Charac_Trait.Skittish and q.quest_enviro == Quest.Quest_Environment.Mountain:
		desc_label.text = "I heard there is perpetual snow in the mountains."
	elif c.charac_trait == Character.Charac_Trait.Skittish and q.quest_enviro == Quest.Quest_Environment.Cave:
		desc_label.text = "An excellent point about caves is that the average temperature is always the same, winter or summer. It never goes higher than 15 degrees, even in smaller caves."
	elif c.charac_trait == Character.Charac_Trait.Supernatural_Hearing and q.quest_monster == Quest.Quest_Monster.Childs:
		desc_label.text = "I have average hearing and can't handle children's cries for more than two minutes. While supernatural hearing can be a blessing in a cave or against a sneaky companion, it's not always the case."
	elif c.charac_trait == Character.Charac_Trait.Acrophobia and q.quest_enviro == Quest.Quest_Environment.Volcano:
		desc_label.text = "Cliffs are very high near our volcanos."
	elif c.charac_trait == Character.Charac_Trait.Acrophobia and q.quest_enviro == Quest.Quest_Environment.Mountain:
		desc_label.text = "Should I explain why sending an acrophobic hero to the mountains was not your best idea?"
	elif c.charac_trait == Character.Charac_Trait.Clumsy and q.quest_type == Quest.Quest_Type.Robbery:
		desc_label.text = "While robbing someone, you must be deft if you don't want to be caught."
	elif c.charac_trait == Character.Charac_Trait.Clumsy and q.quest_type == Quest.Quest_Type.Excavation:
		desc_label.text = "Finding the missing object is one thing, but being able to bring it all back is another."
	elif c.charac_trait == Character.Charac_Trait.Clumsy and q.quest_type == Quest.Quest_Type.Delivery:
		desc_label.text = "Quest Agency is authorized by law to take care of packages containing dynamite. It's better to be careful with it; an accident can happen so quickly."
	elif c.charac_trait == Character.Charac_Trait.Antropophobic and q.quest_type == Quest.Quest_Type.Rescue:
		desc_label.text = "Sometimes, rescuing someone is more manageable than resisting the temptation of making them disappear."
	elif c.charac_trait == Character.Charac_Trait.Antropophobic and q.quest_type == Quest.Quest_Type.Escort:
		desc_label.text = "Escorting someone requires spending time with them. A lot of time. Basically, all day long."
	elif c.charac_trait == Character.Charac_Trait.Antropophobic and q.quest_monster == Quest.Quest_Monster.Spiders:
		desc_label.text = "The spider and the fly can't make a deal. Same with an arachnophobic."
	elif c.charac_trait == Character.Charac_Trait.Ophiophobia and q.quest_monster == Quest.Quest_Monster.Snakes:
		desc_label.text = "It's not clever to send heroes to fight their biggest fear. But you are clever, aren't you?"
	elif c.charac_trait == Character.Charac_Trait.Chatty and q.quest_type == Quest.Quest_Type.Escort:
		desc_label.text = "My uncle is so chatty that I would probably kill myself instead of spending a full day with him."
	elif q.score == 0:
		desc_label.text = "You have to take advantages of the quality of the unemployed hero!"
		
	if q.score > 0:
		desc_label.text = "Excellent, nothing to say!"
		var gold = q.gold_value
		Global.currentGold += gold
		title_label.text = "{name} nailed the {type} mission!".format({"name":c.complete_name, "type":q.quest_type_name().replace("_", " ")})
		title_label.text += "\nCongrats & keep going! You will soon be rich."
		title_label.text += "\nYou won {gold} gold!".format({"gold":gold})
	elif q.score > -2:
		var gold = abs(q.gold_value / 2)
		Global.currentGold += gold
		title_label.text = "{name} partially accomplished the {type} quest.".format({"name":c.complete_name, "type":q.quest_type_name().replace("_", " ")})
		title_label.text += "\nYou won 50% of the reward, {gold} gold.".format({"gold":gold})
	else:
		var gold = abs(q.gold_value / 2)
		Global.currentGold -= gold
		title_label.text = "{name} totally failed the {type} quest. They even may be dead.".format({"name":c.complete_name, "type":q.quest_type_name().replace("_", " ")})
		title_label.text += "\nOur insurance is unhappy about it and requests us to pay {gold} gold.".format({"gold":gold})
	Global.current_level.update_gold()
