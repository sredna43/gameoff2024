extends PlayerState

func run(delta: float) -> String:
	if input.is_zero_approx():
		return "Idle"
	if Input.is_action_just_pressed("dash"):
		return "Dash"
	player.velocity = lerp(player.velocity, input * player.speed, 0.7)
	return super(delta)
