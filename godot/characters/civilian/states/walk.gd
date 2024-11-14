extends CivilianState

var dir = 1

func enter() -> void:
	civilian.walk_timer.start(randf_range(civilian.min_walk_time, civilian.max_walk_time))

func run(delta: float) -> String:
	civilian.progress_ratio += (civilian.speed / civilian.path_len) * delta * dir
	if civilian.progress_ratio == 1 || civilian.progress_ratio == 0:
		dir *= -1
		return "Idle"
	return super(delta)
