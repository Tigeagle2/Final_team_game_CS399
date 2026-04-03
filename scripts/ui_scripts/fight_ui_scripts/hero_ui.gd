extends Control
## Choses the hero, The id is used for determining the output and elemnts of the UI
@export_enum("hero 1", "hero 2", "hero 3") var hero_id: int
## signal used to tell the tab container to change to a new tab
signal change_tab
## stores the starting position for the skill menu for the tweens to use
@onready var skill_home_x: float = %skill_menu.position.x
var active_skill_tween: Tween
## How offset the Tweens starting and ending locations are
var skill_tween_offset: int = 50
## How long the tweens take
var skill_tween_duration: float = 0.3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_menu()
	%skill_menu.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func setup_menu():
	if hero_id == 0:
		%skill_1_button.set_text("hero 1 skill 1")
		%skill_2_button.set_text("hero 1 skill 2")
		%skill_3_button.set_text("hero 1 skill 3")
		%skill_4_button.set_text("hero 1 skill 4")
	elif hero_id == 1:
		%skill_1_button.set_text("hero 2 skill 1")
		%skill_2_button.set_text("hero 2 skill 2")
		%skill_3_button.set_text("hero 2 skill 3")
		%skill_4_button.set_text("hero 2 skill 4")
	elif hero_id == 2:
		%skill_1_button.set_text("hero 3 skill 1")
		%skill_2_button.set_text("hero 3 skill 2")
		%skill_3_button.set_text("hero 3 skill 3")
		%skill_4_button.set_text("hero 3 skill 4")
	else:
		print("invalid hero selection")
		get_tree().quit(1843)
func toggle_skill_menu():
	if %skill_menu.visible:
		fly_out()
		%skills_button.grab_focus()
	else:
		%skill_menu.show()
		%skill_1_button.grab_focus()
		fly_in()
func emit_change_tab():
	change_tab.emit()
func fly_in():
	if active_skill_tween and active_skill_tween.is_running():
		active_skill_tween.kill()
	active_skill_tween = create_tween()
	%skill_menu.position.x = skill_home_x + skill_tween_offset
	%skill_menu.modulate.a = 0.0
	active_skill_tween.set_trans(Tween.TRANS_QUART)
	active_skill_tween.set_ease(Tween.EASE_OUT)
	active_skill_tween.tween_property(%skill_menu, "position:x", skill_home_x, skill_tween_duration)
	active_skill_tween.parallel().tween_property(%skill_menu, "modulate:a", 1.0, skill_tween_duration)
func fly_out():
	if active_skill_tween and active_skill_tween.is_running():
		active_skill_tween.kill()
	active_skill_tween = create_tween()
	var final_position_x = skill_home_x + skill_tween_offset
	%skill_menu.modulate.a = 1.0
	active_skill_tween.set_trans(Tween.TRANS_QUART)
	active_skill_tween.set_ease(Tween.EASE_OUT)
	active_skill_tween.tween_property(%skill_menu, "position:x", final_position_x, skill_tween_duration)
	active_skill_tween.parallel().tween_property(%skill_menu, "modulate:a", 0.0, skill_tween_duration)
	active_skill_tween.tween_callback(%skill_menu.hide)
	
func input_focus():
	%attack_button.grab_focus()
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("bottom_button") && %skill_menu.visible:
		toggle_skill_menu()
		
func _on_attack_button_pressed() -> void:
	if hero_id == 0:
		pass
	elif hero_id == 1:
		pass
	elif hero_id == 2:
		pass
	emit_change_tab()

func _on_defend_button_pressed() -> void:
	if hero_id == 0:
		pass
	elif hero_id == 1:
		pass
	elif hero_id == 2:
		pass

func _on_skills_button_pressed() -> void:
	toggle_skill_menu()

func _on_run_button_pressed() -> void:
	pass # Replace with function body.

func _on_skill_1_button_pressed() -> void:
	if hero_id == 0:
		pass
	elif hero_id == 1:
		pass
	elif hero_id == 2:
		pass

func _on_skill_2_button_pressed() -> void:
	if hero_id == 0:
		pass
	elif hero_id == 1:
		pass
	elif hero_id == 2:
		pass

func _on_skill_3_button_pressed() -> void:
	if hero_id == 0:
		pass
	elif hero_id == 1:
		pass
	elif hero_id == 2:
		pass

func _on_skill_4_button_pressed() -> void:
	if hero_id == 0:
		pass
	elif hero_id == 1:
		pass
	elif hero_id == 2:
		pass
