extends PlayerState

func enter():
	player.velocity = input * player.dash_speed
	player.dash_timer.start()

func run(delta) -> String:
	if player.dash_timer.is_stopped():
		return "Walk"
	player.velocity = lerp(player.velocity, input * player.speed, 0.1)
	return super(delta)
