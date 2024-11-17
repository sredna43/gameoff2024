extends PlayerState

func enter():
	print("Entered cutscene")

func run(delta) -> String:
	if !player.in_cutscene:
		return "Idle"
	return super(delta)
