class_name Battler extends Node2D

@export var display_name: String

@export_category("STATS")
@export var max_health: float
var health: float = 100
@export var max_energy: float
var energy: float = 100
@export var speed: float
@export var strength: float = 1.0
@export var defense: float = 1.0

@export_category("MOVES")
@export var move_array: Array[Move]
@export var type: String
@export var battler_name: String
signal health_updated
var selected_move: Move
var selected_targets: Array[Battler]

var defending: bool

func _ready():
	pass

func select_move(index: int, targets: Array[Battler]):
	if battler_name:
		get_owner().add_text_line(battler_name + " Selected Move!")
		print(battler_name + " Selected Move!")
	else:
		get_owner().add_text_line("Battler Selected Move!")
		print("Battler Selected Move!")
	defending = false
	selected_move = move_array[index]
	selected_targets = targets

func play_animation(animation_name: StringName):
	'''if !%AnimatedSprite2D:
		return
	# play an animation for the battler here
	var sprite: AnimatedSprite2D  = %AnimatedSprite2D

	sprite.play(animation_name)
	await sprite.animation_finished
	get_owner().add_text_line('Battler played animation')'''
	if animation_name:
		if type == "attacker":
			get_parent().attack()
		elif type == "healer":
			get_parent().heal()
		else:
			var attack_name: String
			if randi_range(1, 2) == 1:
				attack_name = "punch"
			else:
				attack_name = "throw"
			get_parent().trigger_attack(attack_name)
			get_owner().add_text_line(name + " used " + attack_name)

func damage(value: float):
	if defending:
		health -= round(value/defense) / 2.0
		get_owner().add_text_line('Damaged battler by ' + str(round(value/defense) / 2.0))
	else:
		health -= round(value/defense)
		get_owner().add_text_line("Damaged battler by " + str(round(value/defense)))
	health_updated.emit()
	get_owner().add_text_line(name + " now has " + str(health) + " hp")

func heal(value: float):
	health += value
	get_owner().add_text_line("healed battler by " + str(value))
	health_updated.emit()

func defend():
	defending = true
	get_owner().add_text_line('Battler started defending!')

func roll_stats() -> void:
	max_health = 100.0
	max_energy = 100.0
	speed = 0
	strength = 1.0
	defense = 1.0
	
	max_health += randf_range(-50, 50)
	speed += randf_range(-5, 5)
	strength += randf_range(-1.5, 1.5)
	defense += randf_range(-1.5, 1.5)
