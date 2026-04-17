class_name PlayerController extends TeamController

signal battler_selected_move

@export var player_ui: Node2D

func decide_moves():
	player_ui.hero_moved.connect(_on_hero_moved)

	for battler in battler_array:
		await battler_selected_move
	
	moves_decided.emit(self)

func _on_hero_moved(move_index: int, battler_index: int, battler_array: Array[Battler]):
	var battler: Battler = battler_array[battler_index]
	battler.select_move(move_index,battler_array)
	battler_selected_move.emit()
