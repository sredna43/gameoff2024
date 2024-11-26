extends CharacterBody2D
class_name Player

const speed = 500
const dash_speed = 2000

@onready var fsm: StateMachine = $FSM
@onready var dash_timer: Timer = $DashTimer
@onready var debug: Label = $Debug
@onready var hud: HUD = $CanvasLayer/HUD
@onready var anim: AnimationTree = $AnimationTree
@onready var sprites: Node2D = $Sprites

var anim_sm: AnimationNodeStateMachinePlayback

var in_cutscene = false

func _ready() -> void:
	anim_sm = anim["parameters/StateMachine/playback"]

func _physics_process(delta: float) -> void:
	fsm.run(delta)
	debug.text = fsm.current_state.name
	if velocity.x < 0:
		sprites.scale.x = -1
	else:
		sprites.scale.x = 1
	move_and_slide()


func enter_cutscene():
	in_cutscene = true


func exit_cutscene():
	in_cutscene = false
