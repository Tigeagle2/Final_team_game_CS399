extends CharacterBody2D

const movement_speed = 300.0
var entered
var inShop

var facing: Vector2 = Vector2(0, 1)
var in_battle: bool = false

'''func get_input():
	var input_direction = Input.get_vector("KEY_A","KEY_D","KEY_W","KEY_S")
	velocity = input_direction * movement_speed'''
	

func _physics_process(delta: float) -> void:
	'''if Input.is_action_just_pressed("KEY_E") && entered == true:
		get_tree().change_scene_to_file("res://scenes/Shop.tscn")
		inShop = true
	if Input.is_action_just_pressed("KEY_E") && entered == true && inShop == true:
		get_tree().change_scene_to_file("res://scenes/Main_Level.tscn")
		inShop = false'''
	
	move_and_slide()
	


'''func _on_door_area_body_entered(body: Node) -> void:
	entered = true
	
func _on_door_area_body_exited(body: Node2D) -> void:
	entered = false'''
	
