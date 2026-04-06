extends TransitMenu

func _ready() -> void:
	enter()

func _on_start_pressed() -> void:
	click_sound.play()
	release()

func _on_options_pressed() -> void:
	click_sound.play()
	release()

func _on_credits_pressed() -> void:
	click_sound.play()

func _on_exit_pressed() -> void:
	click_sound.play()
	cover.show()
	var tween = create_tween()
	tween.tween_property(cover, "color", Color(0, 0, 0, 1), transit_duration)
	
	await get_tree().create_timer(transit_duration).timeout
	get_tree().quit()
