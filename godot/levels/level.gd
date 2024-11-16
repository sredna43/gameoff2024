extends Node2D
class_name Level

@onready var NPCS_NODE: Node = $NPCs

var npcs: Array[Civilian]
var secrets_told = 0
var civilian: Civilian

func _ready():
	for path in NPCS_NODE.get_children():
		civilian = path.get_child(0)
		npcs.push_back(civilian)
		civilian.connect("told_secret", _on_npc_told_secret)

func _on_level_won():
	print("won level")

func _on_npc_told_secret():
	secrets_told += 1
	if secrets_told == npcs.size():
		_on_level_won()
