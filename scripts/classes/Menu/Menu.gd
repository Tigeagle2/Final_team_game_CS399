extends Control
class_name Menu

##If true, menu will already be positioned within the viewport. Otherwise, menu will be positioned above the screen.
@export var default: bool

var slide_duration: float = 1.5
var active: bool = false

func _ready() -> void:
	if !default:
		position.y = -(get_viewport_rect().size.y)

func summon() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position:y", 0, slide_duration).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)
	
	await get_tree().create_timer(slide_duration).timeout
	active = true

func release() -> void:
	active = false
	var tween = create_tween()
	tween.tween_property(self, "position:y", -(get_viewport_rect().size.y), slide_duration).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)

func activate_menu(menu: Menu) -> void:
	release()
	menu.summon()
