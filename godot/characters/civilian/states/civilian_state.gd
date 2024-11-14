extends State
class_name CivilianState

var civilian: Civilian
var input: Vector2

func _ready() -> void:
	await(owner.ready)
	civilian = owner as Civilian
	assert(civilian != null)
	super()
