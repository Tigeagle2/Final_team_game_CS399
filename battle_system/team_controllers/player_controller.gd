class_name PlayerController extends TeamController

signal battler_selected_move

func _ready() -> void:
	moves_decided.emit(self)

func decide_moves():
	player_ui.temp_signal.connect(_on_temp_signal)

	for battler in battler_array:
		await battler_selected_move
	
	moves_decided.emit(self)

func _on_temp_signal(battler_index: int, move_index: int):
	var battler: Battler = battler_array[battler_index]
	battler.select_move(move_index)
	battler_selected_move.emit()
