extends Enemy

@onready var sprites: AnimatedSprite2D = $AnimatedSprite2D

var attacking: bool = false

func _ready() -> void:
	if !sprites.animation_finished.is_connected(_on_animation_finished):
		sprites.animation_finished.connect(_on_animation_finished)
	sprites.play("idle")

func punch() -> void:
	attacking = true
	sprites.play("punch")

func throw() -> void:
	attacking = true
	sprites.play("throw")

func _on_animation_finished() -> void:
	if sprites.animation == "punch" || sprites.animation == "throw":
		attacking = false
		sprites.play("recover")
	elif sprites.animation == "recover":
		sprites.play("idle")
