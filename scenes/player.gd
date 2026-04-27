extends CharacterBody2D

@export var camera: Camera2D

const movement_speed = 300.0
var entered
var inShop

var facing: Vector2 = Vector2(0, 1)
var in_battle: bool = false

var battles_won: int = 0

func _ready() -> void:
	global_position = cheats.relative_pos

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("CTRL") && Input.is_action_just_pressed("KEY_W"):
		battle_won()
	else:
		move_and_slide()

func battle_won() -> void:
	cheats.battles_won += 1
	cheats.relative_pos = global_position
	if cheats.battles_won == 5:
		get_tree().change_scene_to_file("res://scenes/MENUS/WIN.tscn")

'''func _on_door_area_body_entered(body: Node) -> void:
	entered = true
	
func _on_door_area_body_exited(body: Node2D) -> void:
	entered = false'''
	
