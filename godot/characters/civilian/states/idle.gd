extends CivilianState

func enter() -> void:
	civilian.idle_timer.start(randf_range(civilian.min_idle_time, civilian.max_idle_time))

func run(delta: float) -> String:
	return super(delta)
