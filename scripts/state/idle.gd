extends State

func update(_delta: float) -> void:
	if !player.in_battle:
		if Input.is_action_pressed("KEY_W") || Input.is_action_pressed("KEY_A") || Input.is_action_pressed("KEY_S") || Input.is_action_pressed("KEY_D"):
			emit("walking")

func physics_update(_delta: float) -> void:
	pass

func enter() -> void:
	if get_parent().get_last_direction() == Vector2(0, -1):
		sprites.play("idle-up")
	elif get_parent().get_last_direction() == Vector2(0, 1):
		sprites.play("idle-down")
	else:
		sprites.play("idle-side")
		if get_parent().get_last_direction().x == 1:
			sprites.flip_h = false
		else:
			sprites.flip_h = true
func exit() -> void:
	pass
