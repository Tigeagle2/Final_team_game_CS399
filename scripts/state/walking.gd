extends State

signal switched_direction

var sprint_multiplier: float = 1.5
var sprinting: bool = false

func _ready() -> void:
	switched_direction.connect(_on_switched_direction)

func update(_delta: float) -> void:
	if player.in_battle || player.velocity == Vector2(0, 0):
		sprites.speed_scale = 1
		emit("idle")

func physics_update(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("KEY_A", "KEY_D", "KEY_W", "KEY_S")
	
	if direction:
		if randi_range(1, 250) == 250:
			player.in_battle = true
			emit("battling")
			get_owner().get_parent().trigger_battle()
		else:
			var switched: bool = false
			player.velocity = direction * player.movement_speed
			
			if Input.is_action_pressed("SHIFT"):
				player.velocity *= sprint_multiplier
				sprites.speed_scale *= sprint_multiplier
			else:
				sprites.speed_scale = 1
			
			if player.facing.x != direction.x:
				player.facing.x = direction.x
				switched = true
			if player.facing.y != direction.y:
				player.facing.y = direction.y
				switched = true
			if switched:
				switched_direction.emit()
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.movement_speed/5)
		player.velocity.y = move_toward(player.velocity.y, 0, player.movement_speed/5)

func enter() -> void:
	set_anim_direction(get_parent().get_last_direction())

func _on_switched_direction() -> void:
	var new_direction: Vector2 = get_parent().get_last_direction()
	set_anim_direction(new_direction)

func set_anim_direction(dir: Vector2):
	if dir == Vector2(0, -1):
		sprites.flip_h = false
		sprites.play("walk-up")
	elif dir == Vector2(0, 1):
		sprites.flip_h = false
		sprites.play("walk-down")
	else:
		sprites.play("walk-side")
		if dir.x > 0:
			sprites.flip_h = false
		else:
			sprites.flip_h = true
