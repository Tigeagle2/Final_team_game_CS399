extends TransitMenu

var entry_duration: float = 2.0

func _ready() -> void:
	set_process(false)
	enter()
	await get_tree().create_timer(transit_duration + 0.5).timeout
	set_process(true)

func _process(_delta: float) -> void:
	if Input.is_anything_pressed():
		click_sound.play()
		transit_scene()
