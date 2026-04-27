extends Node2D
@onready var sprites: AnimatedSprite2D = $AnimatedSprite2D

func punch() -> void:
	sprites.play("punch")

func throw() -> void:
	sprites.play("throw")

func _on_animation_finished() -> void:
	if sprites.animation == "punch" || sprites.animation == "throw":
		sprites.play("recover")
	elif sprites.animation == "recover":
		sprites.play("idle")
