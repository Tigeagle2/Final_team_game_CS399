class_name Battler extends Node2D

@export_category("STATS")
@export var max_health: float
var health: float
@export var max_energy: float
var energy: float
@export var speed: float

@export_category("MOVES")
@export var move_array: Array[Move]

var selected_move: Move

func _ready():
	pass

func select_move(index: int):
	selected_move = weakref(move_array[index])

func play_animation():
	pass