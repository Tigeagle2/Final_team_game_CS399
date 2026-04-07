extends Menu

@export var MainMenu: TransitMenu

func _on_return_pressed() -> void:
	click_sound.play()
	release()
	MainMenu.summon()
