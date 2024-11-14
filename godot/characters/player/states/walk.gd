extends PlayerState

func run(delta: float) -> String:
	if (input.is_zero_approx()):
		return "Idle"
	player.velocity = input * player.speed
	return super(delta)
