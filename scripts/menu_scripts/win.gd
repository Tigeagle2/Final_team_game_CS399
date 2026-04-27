extends TransitMenu

func _ready() -> void:
	trigger_if_default()
	enter()

func on_restart_pressed() -> void:
	transit_scene()

func on_quit_pressed() -> void:
	click_sound.play()
	cover.show()
	var tween = create_tween()
	tween.tween_property(cover, "color", Color(0, 0, 0, 1), transit_duration)
	
	await get_tree().create_timer(transit_duration).timeout
	get_tree().quit()
