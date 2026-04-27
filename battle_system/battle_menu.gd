extends Menu
@export var battle_scene: Node2D

func _ready() -> void:
	trigger_if_default()

func summon() -> void:
	battle_scene.get_random_enemies()
	var tween = create_tween()
	tween.tween_property(self, "position:x", 0, slide_duration).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	await get_tree().create_timer(slide_duration).timeout
	active = true
