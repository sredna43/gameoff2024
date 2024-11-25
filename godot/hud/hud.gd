extends Control
class_name HUD

@onready var stopwatch = $VBoxContainer/MarginContainer/Stopwatch
@onready var secrets_tracker = $VBoxContainer/MarginContainer/SecretsTracker

var told_secrets = 0
var secrets_to_tell = 0

func _process(_delta: float) -> void:
	stopwatch.text = str(Globals.time).pad_decimals(2)
	secrets_tracker.text = "%s/%s Secrets Told" % [told_secrets, secrets_to_tell]
