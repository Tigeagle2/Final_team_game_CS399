extends Node

var acting: bool = false
@onready var sprites: AnimatedSprite2D = $Sprites

func _ready() -> void:
	sprites.play("idle")

func heal() -> void:
	acting = true
	sprites.play("attack")

func defend() -> void:
	acting = true
	self.modulate = Color(2.5, 2.5, 2.5, 1)
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 1.0)
	
	await get_tree().create_timer(1.0).timeout
	acting = false

func _on_animation_finished() -> void:
	if sprites.animation == "attack":
		acting = false
		sprites.play("idle")

func damaged() -> void:
	self.modulate = Color(1, 0.353, 0.329, 1)
	var tween = create_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 1.0)
