extends State
class_name PlayerState

var player: Player
var input: Vector2

func _ready() -> void:
	await(owner.ready)
	player = owner as Player
	assert(player != null)
	super()

func _physics_process(_delta: float) -> void:
	input = Input.get_vector("left", "right", "up", "down", 0.3)

func run(delta) -> String:
	if player.in_cutscene:
		return "Cutscene"
	return super(delta)
