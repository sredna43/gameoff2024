extends PathFollow2D
class_name Civilian

signal told_secret

@onready var fsm: StateMachine = $FSM
@onready var walk_timer: Timer = $WalkTimer
@onready var idle_timer: Timer = $IdleTimer

@export var speed: float = 100
@export var max_walk_time: float = 2.0
@export var min_walk_time: float = 0.5
@export var max_idle_time: float = 5.0
@export var min_idle_time: float = 2.0

var knows_secret = false
var path_len = 100
var path: Path2D
var parent: Node

func _ready() -> void:
	assert(max_walk_time >= min_walk_time, "max_walk_time must be greater than min_walk_time")
	assert(max_idle_time >= min_idle_time, "max_idle_time must be greater than min_idle_time")
	walk_timer.wait_time = max_walk_time
	idle_timer.wait_time = max_idle_time
	idle_timer.start(randf_range(min_idle_time, max_idle_time))
	parent = get_parent()
	if parent != null:
		await (parent.ready)
		path = parent as Path2D
		assert(path != null, "Civilians must be children of Path2Ds")
		path_len = path.curve.get_baked_length()


func _physics_process(delta: float) -> void:
	fsm.run(delta)


func _on_walk_timer_timeout() -> void:
	fsm.change_state("Idle")


func _on_idle_timer_timeout() -> void:
	fsm.change_state("Walk")


func _on_area_2d_body_entered(body):
	if body is Player and knows_secret == false:
		print("I know the secret now :)")
		emit_signal("told_secret")
		knows_secret = true
