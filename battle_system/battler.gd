class_name Battler extends Node2D

@export_category("STATS")
@export var max_health: float
var health: float = 50
@export var max_energy: float
var energy: float
@export var speed: float
@export var strength: float = 1.0
@export var defense: float = 1.0

@export_category("MOVES")
@export var move_array: Array[Move]

var selected_move: Move
signal health_updated
func _ready():
	pass

func select_move(index: int):
	selected_move = weakref(move_array[index])

func play_animation(animation_name: StringName):
	# play an animation for the battler here
	pass
