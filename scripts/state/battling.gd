extends State

func update(_delta: float) -> void:
	if !player.in_battle:
		emit("idle")

func enter() -> void:
	player.velocity = Vector2(0, 0)
	sprites.play("idle-down")
