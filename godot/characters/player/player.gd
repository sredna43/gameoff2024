extends CharacterBody2D
class_name Player

const speed = 650
const dash_speed = 2000

@onready var fsm: StateMachine = $FSM
@onready var dash_timer: Timer = $DashTimer
@onready var debug: Label = $Debug

var in_cutscene = false

func _physics_process(delta: float) -> void:
	fsm.run(delta)
	debug.text = fsm.current_state.name
	move_and_slide()


func enter_cutscene():
	in_cutscene = true


func exit_cutscene():
	in_cutscene = false
