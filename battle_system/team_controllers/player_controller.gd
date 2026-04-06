class_name PlayerController extends TeamController

func _ready() -> void:
	moves_decided.emit(self)