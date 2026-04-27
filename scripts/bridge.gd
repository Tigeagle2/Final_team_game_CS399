extends Node
var enemy: Enemy
@export var battler: Battler
@export var name_plate: Label

func trigger_attack(attack_name: String) -> void:
	if attack_name == "punch":
		enemy.punch()
	elif attack_name == "throw":
		enemy.throw()
	else:
		print("error")

func set_random_name(enemy_number: int) -> void:
	battler.roll_stats()
	var new_name: String = name_list.get_random_name()
	battler.battler_name = new_name
	name_plate.text = new_name
	get_parent().fight_screen.set_button_name(enemy_number, new_name)
