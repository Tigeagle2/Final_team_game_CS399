extends Menu
class_name TransitMenu

@export var scene_transit_path: String
@export var cover: ColorRect
var transit_duration: float = 2.0

func transit_scene() -> void:
	if scene_transit_path:
		cover.show()
		var tween = create_tween()
		tween.tween_property(cover, "color", Color(0, 0, 0, 1), transit_duration)
		
		await get_tree().create_timer(transit_duration + 0.5).timeout
		get_tree().call_deferred("change_scene_to_file", scene_transit_path)

func enter() -> void:
	cover.show()
	var tween = create_tween()
	tween.tween_property(cover, "color", Color(0, 0, 0, 0), transit_duration)
	
	await get_tree().create_timer(transit_duration).timeout
	cover.hide()
