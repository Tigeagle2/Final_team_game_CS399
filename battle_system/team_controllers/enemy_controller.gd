class_name EnemyController extends TeamController

func _ready() -> void:
	moves_decided.emit(self)