extends Area2D

<<<<<<< HEAD
var entered
var inShop = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	'''if entered == true && Input.is_action_just_pressed("KEY_E") && inShop == false:
		get_tree().change_scene_to_file("res://scenes/Shop.tscn")
		inShop = true
		
	if entered == true && Input.is_action_just_pressed("KEY_E") && inShop == true:
		get_tree().change_scene_to_file("res://scenes/Main_Level.tscn")
		inShop = false'''
	pass
'''
func _on_body_entered(body: Node2D) -> void:
	entered = true

func _on_body_exited(body: Node2D) -> void:
	entered = false
'''
=======

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if Input.is_action_just_pressed("KEY_E"):
			get_tree().change_scene_to_file("res://scenes/Shop.tscn")
	
>>>>>>> efc6d6ad4094db87e9b966487612030956aea6a4
