extends CharacterBody2D


const SPEED = 300.0

func get_input():
	var input_direction = Input.get_vector("KEY_A","KEY_D","KEY_W","KEY_S")
	velocity = input_direction * SPEED
	

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
