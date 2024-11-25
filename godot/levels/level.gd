extends Node2D
class_name Level

@onready var NPCS_NODE: Node = $NPCs
@onready var player: Player = $Player

var npcs: Array[Civilian]
var secrets_told = 0
var civilian: Civilian
var level_won = false

var on_dialogue_line = 0
var in_dialogue = true
var text: Array[String] = []

func enter_cutscene():
	on_dialogue_line = 0
	in_dialogue = true
	player.enter_cutscene()
	print(text[on_dialogue_line])

func exit_cutscene():
	player.exit_cutscene()
	in_dialogue = false

func next_dialogue():
	if !in_dialogue:
		return
	on_dialogue_line = min(on_dialogue_line + 1, text.size() - 1)
	print(text[on_dialogue_line])
	if on_dialogue_line == text.size() - 1:
		exit_cutscene()

func skip_dialogue():
	on_dialogue_line = text.size() - 1
	print(text[on_dialogue_line])
	exit_cutscene()

func _ready():
	player.hud.told_secrets = 0
	enter_cutscene()
	Globals.time = 0.0
	for path in NPCS_NODE.get_children():
		civilian = path.get_child(0)
		npcs.push_back(civilian)
		civilian.told_secret.connect(_on_npc_told_secret)
	player.hud.secrets_to_tell = npcs.size()

func _process(delta):
	if !player.in_cutscene and !level_won:
		Globals.time += delta
	if (Input.is_action_just_pressed("select") or Input.is_action_just_pressed("ui_select")):
		next_dialogue()
	if (Input.is_action_just_pressed("back") or Input.is_action_just_pressed("ui_cancel")):
		skip_dialogue()

func _on_level_won():
	print("won level")
	level_won = true

func _on_npc_told_secret():
	secrets_told += 1
	player.hud.told_secrets = secrets_told
	if secrets_told == npcs.size():
		_on_level_won()
