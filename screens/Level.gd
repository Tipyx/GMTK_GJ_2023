class_name Level extends Node2D

@export var hellos_halfing : Array[AudioStreamWAV]
@export var hellos_human : Array[AudioStreamWAV]
@export var hellos_orc : Array[AudioStreamWAV]
@export var hellos_unicorn : Array[AudioStreamWAV]
@export var hellos_dwarf : Array[AudioStreamWAV]
@export var hellos_elven : Array[AudioStreamWAV]
@export var papers_sfx : Array[AudioStream]

@onready var sprite_radio_off := preload("res://assets/radioOff.png")
@onready var sprite_radio_on := preload("res://assets/radioOn.png")
@onready var sprite_radio_hs := preload("res://assets/radioHS.png")
@onready var radio_button_click := preload("res://sounds/sfxs/radioButtonClick.wav")

@onready var quest_ps := preload("res://gp_elements/Quest.tscn")
@onready var quest_wrapper := $QuestWrapper
@onready var report_ps := preload("res://ui/ReportScreen.tscn")

@onready var charac_dialogBox := $Charac_DialogBox
@onready var charac_label := $Charac_DialogBox/Charac_Label
@onready var offer_button := $OfferButton
@onready var skip_button := $SkipButton
@onready var valid_report_button := $ValidReportButton
@onready var gold_label := $GoldLabel
@onready var timer_label := $TimerLabel
@onready var timer := $MainTimer
@onready var music_button := $MusicButton
@onready var music_button_area := $MusicButton/Area2D
@onready var hello_sfx_player := $HelloSfxPlayer
@onready var ambiant_sounds := $AmbiantSounds
@onready var radio_sounds := $RadioSound

var current_character : Character

var current_quests : Array[Quest]
var selected_quest : Quest = null

var current_report : Node2D = null

var base_format_texts = [
	"My name is {name} & I am {number} years old. I am a proud {specie} {class}. {trait}",
	"{name}, {number} years old. Trained as {class} and part of the {specie} community. {trait} That should be all.",
	"I am looking for a job, but everyone does here. I used to be a {class} even if I am rusty. I am born & raised as a {specie}. {trait}",
	"Hello! You can call me {name}. I am born {number} years ago among the {specie}. I am now a {class}. {trait}",
	"Hi there! My name is {name}. I am a {class} looking for money, so basically, jobs... If you missed it, I am a {specie}. {trait}"
]

var first_names = [
	"Kahless",
	"Garak",
	"Narekha",
	"Aki",
	"Jakobe",
	"Ahmès",
	"Claudia",
	"Pan",
	"Ari-Elh",
	"Joe",
	"Pup",
	"Urduk",
	"Chi",
	"Nexee",
	"Aello",
	"Ital",
	"Temgri",
	"Nexee",
	"Aello",
	"Ital",
	"Temgri",
	"Ildhim",
	"Dikhjo",
	"Rollgurg",
	"Armug",
	"Noskili",
	"Thrátul",
	"Ornore",
	"Calclai",
	"Boland",
	"Sarei",
	"Kevis",
	"Arrho",
	"Binico",
	"Melsa",
	"Senbella",
	"Orsha",
	"Ogat",
	"Luor",
	"Aggala",
]

var last_names = [
	"Keensun",
	"Dweobr",
	"Mist",
	"Firebash",
	"Clanflow",
	"Palegem",
	"Glowash",
	"Eventree",
	"Hilltaker",
	"Chestroot",
	"Starhide",
	"Bonekeeper",
	"Plainsky",
	"Iceaxe",
	"Ashblaze",
	"Thrunch",
	"de Tdon",
	"Rex",
	"Darvis",
	"Yendar",
	"Tam",
	"Aumar",
	"Halforcen",
	"Taria",
	"Lothar",
	"Jenkins",
	"Baggins",
	"Gamgee",
	"Lorien",
	"Maggot",
	"Cotton",
	"Took",
	"Farseer",
	"Fallstar",
	"Chandler",
	"de Troil",
	"Qadehar",
	"Belacqua",
	"Coulter",
	"Asriel",
]

var level_scores : Array[int] = [0, 0, 0] #perfect, middle, bad
var day_gold = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.currentDay += 1
	
	Events.quest_clicked.connect(_on_quest_clicked)
	
	offer_button.pressed.connect(_on_offer_button_pressed)
	valid_report_button.pressed.connect(_on_valid_report_button_pressed)
	skip_button.pressed.connect(_on_skip_button_pressed)
	
	generate_new_character()
	generate_quest()
	
	update_gold()
	timer.start()
	timer.timeout.connect(_timer_out)
	
	music_button_area.input_event.connect(_on_music_button_pressed)
	
func _on_music_button_pressed(_viewport, event:InputEvent, _shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if Global.sound_status == Global.Sound_Status.All:
			Global.sound_status = Global.Sound_Status.Ambiant
			music_button.texture = sprite_radio_off
			ambiant_sounds.stream_paused = false
			radio_sounds.stream_paused = true
		elif Global.sound_status == Global.Sound_Status.Ambiant:
			Global.sound_status = Global.Sound_Status.Off
			music_button.texture = sprite_radio_hs
			ambiant_sounds.stream_paused = true
			radio_sounds.stream_paused = true
		else:
			Global.sound_status = Global.Sound_Status.All
			music_button.texture = sprite_radio_on
			ambiant_sounds.stream_paused = false
			radio_sounds.stream_paused = false
		
		SoundManager.play_sound(radio_button_click)
		AudioServer.set_bus_mute(0, Global.sound_status == Global.Sound_Status.Off)
	
func _timer_out():
	if Global.currentDay < 5:
		Global.main.go_to_end_day_screen(day_gold, level_scores)
	else:
		Global.main.go_to_end_game_screen()
	
func update_gold():
	gold_label.text = str(Global.currentGold)

func generate_new_character():
	if current_character:
		current_character.queue_free()
	
	current_character = Character.new()
	
	var base_text = base_format_texts.pick_random()
	current_character.complete_name = first_names.pick_random() + " " + last_names.pick_random()
	charac_label.text = base_text.format({"name":current_character.complete_name, "number":randi_range(20, 300), "class":current_character.job.name.capitalize(), "specie":current_character.specie.name.capitalize(), "trait":current_character.traitData.desc})
	hello_sfx_player.stream = current_character.specie.hellos_sfx.pick_random()
	hello_sfx_player.play()
	
func generate_quest():
	current_quests.clear()
	
	var t := get_tree().create_tween()
	
	var scores = [1]
	
	if Global.currentDay == 5:
		scores.append(-2)
	
	while scores.size() < 3:
		var rnd = randi() % 100 + 1
		if Global.currentDay == 1:
			if rnd < 40: scores.append(-1)
			elif rnd < 70: scores.append(0)
			elif rnd < 80: scores.append(1)
			else: scores.append(2)
		elif Global.currentDay == 2:
			if rnd < 15: scores.append(-2)
			elif rnd < 45: scores.append(-1)
			elif rnd < 65: scores.append(0)
			elif rnd < 85: scores.append(1)
			else: scores.append(2)
		elif Global.currentDay == 3:
			if rnd < 20: scores.append(-2)
			elif rnd < 40: scores.append(-1)
			elif rnd < 65: scores.append(0)
			elif rnd < 85: scores.append(1)
			else: scores.append(2)
		elif Global.currentDay == 4:
			if rnd < 30: scores.append(-2)
			elif rnd < 50: scores.append(-1)
			elif rnd < 75: scores.append(0)
			elif rnd < 85: scores.append(1)
			else: scores.append(2)
		else:
			if rnd < 40: scores.append(-2)
			elif rnd < 50: scores.append(-1)
			elif rnd < 75: scores.append(0)
			elif rnd < 85: scores.append(1)
			else: scores.append(2)
	
	for i in scores:
		var quest : Quest = quest_ps.instantiate() as Quest
		quest_wrapper.add_child(quest)
		quest.init(current_character, i)
		quest.position.x = (current_quests.size() - 1) * 400
		var pos = quest.position
		quest.position += Vector2(0, 1000)
		t.tween_callback(SoundManager.play_sound.bind(papers_sfx.pick_random()))
		t.tween_property(quest, "position", pos, 0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUART)
		quest.rotation_degrees += randf_range(-5, 5)
		current_quests.append(quest)
#		SoundManager.play_sound(papers_sfx.pick_random())

func _on_offer_button_pressed():
	if not selected_quest:
		return
	
	SoundManager.play_sound(preload("res://sounds/sfxs/buttonClick.wav"))
	
	if selected_quest.score > 0:
		level_scores[0] += 1
		day_gold += selected_quest.gold_value
	elif selected_quest.score > -2:
		level_scores[1] += 1
		day_gold += abs(selected_quest.gold_value/2)
	else:
		level_scores[2] += 1
		day_gold += abs(selected_quest.gold_value/2)
	# End Animation
	remove_quest_and_character()
	
	await create_tween().tween_interval(0.5).finished
	
	current_report = report_ps.instantiate() as ReportScreen
	add_child(current_report)
	current_report.init(current_character, selected_quest)
	var pos := current_report.global_position
	current_report.global_position -= Vector2(2000, 0)
	get_tree().create_tween().tween_property(current_report, "global_position", pos, 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	get_tree().create_tween().tween_property(valid_report_button, "modulate", Color.WHITE, 0.2)
	valid_report_button.disabled = false
	timer.paused = true
	
func _on_valid_report_button_pressed():
	SoundManager.play_sound(preload("res://sounds/sfxs/buttonClick.wav"))
	
	selected_quest = null
	get_tree().create_tween().tween_property(current_report, "global_position", current_report.global_position + Vector2(2000, 0), 1).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	get_tree().create_tween().tween_property(valid_report_button, "modulate", Color.TRANSPARENT, 0.2)
	valid_report_button.disabled = true
	
#	await create_tween().tween_interval(1).finished
	
	generate_new_character()
	generate_quest()
	
	get_tree().create_tween().tween_property(charac_dialogBox, "scale", Vector2.ONE, 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	get_tree().create_tween().tween_property(offer_button, "modulate", Color.WHITE, 0.2)
	get_tree().create_tween().tween_property(skip_button, "modulate", Color.WHITE, 0.2)
	offer_button.disabled = false
	skip_button.disabled = false
	
	timer.paused = false
	
func _on_skip_button_pressed():
	SoundManager.play_sound(preload("res://sounds/sfxs/buttonClick.wav"))
	
	remove_quest_and_character()
	
	await create_tween().tween_interval(0.5).finished
	
	generate_new_character()
	generate_quest()
	
	get_tree().create_tween().tween_property(charac_dialogBox, "scale", Vector2.ONE, 0.5).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	get_tree().create_tween().tween_property(offer_button, "modulate", Color.WHITE, 0.2)
	get_tree().create_tween().tween_property(skip_button, "modulate", Color.WHITE, 0.2)
	offer_button.disabled = false
	skip_button.disabled = false
	
func _on_quest_clicked(quest:Quest):
	SoundManager.play_sound(papers_sfx.pick_random())
	
	selected_quest = null
	for q in current_quests:
		if q == quest and not q.is_selected:
			selected_quest = q
			q.select()
		else:
			q.unselect()

func remove_quest_and_character():
	offer_button.disabled = true
	skip_button.disabled = true
	get_tree().create_tween().tween_property(offer_button, "modulate", Color.TRANSPARENT, 0.2)
	get_tree().create_tween().tween_property(skip_button, "modulate", Color.TRANSPARENT, 0.2)
	for q in current_quests:
		var t = get_tree().create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)
		t.tween_callback(SoundManager.play_sound.bind(papers_sfx.pick_random()))
		if q != selected_quest:
			t.tween_property(q, "global_position", q.global_position + Vector2(0, 1000), 0.5)
		else:
			t.tween_property(q, "global_position", q.global_position - Vector2(0, 1000), 0.5)
		t.tween_callback(q.queue_free)
	get_tree().create_tween().tween_property(charac_dialogBox, "scale", Vector2.ZERO, 0.2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_IN)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var min = roundi(timer.time_left) / 60
	var sec = roundi(timer.time_left) % 60
	timer_label.text = str(min) + ":" + ("0" if sec < 10 else "") + str(sec)
	pass
