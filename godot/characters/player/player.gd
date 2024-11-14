extends CharacterBody2D
class_name Player

const speed = 400

@onready var fsm: StateMachine = $FSM

func _physics_process(delta: float) -> void:
	fsm.run(delta)
	move_and_slide()
