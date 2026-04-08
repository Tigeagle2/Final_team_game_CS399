extends Node
class_name TimeCounter

var time: float = 0.0
var max_run_time = 30.0

func _process(delta: float) -> void:
	time += delta
	
	# Ensures that object is cut from scene tree after a certain amount of time to prevent memory leaks.
	if time >= max_run_time:
		queue_free()

func pause() -> void:
	set_process(false)

func reset() -> void:
	time = 0.0
