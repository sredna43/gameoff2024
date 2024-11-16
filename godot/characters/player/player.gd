extends CharacterBody2D
class_name Player

const speed = 400

@onready var fsm: StateMachine = $FSM

var in_cutscene = false

func _physics_process(delta: float) -> void:
	if !in_cutscene:
		fsm.run(delta)
	move_and_slide()


func enter_cutscene():
	in_cutscene = true


func exit_cutscene():
	in_cutscene = false
