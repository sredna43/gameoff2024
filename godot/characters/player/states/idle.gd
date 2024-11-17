extends PlayerState

func run(delta: float) -> String:
	if !input.is_zero_approx():
		return "Walk"
	player.velocity = lerp(player.velocity, Vector2.ZERO, 0.7)
	return super(delta)
