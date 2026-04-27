extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if Input.is_action_just_pressed("KEY_E"):
			get_tree().change_scene_to_file("res://scenes/Shop.tscn")
	
