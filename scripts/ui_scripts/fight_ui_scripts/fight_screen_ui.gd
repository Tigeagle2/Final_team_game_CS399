extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	##Stores the hero_ui children
	var hero_ui_children = get_tree().get_nodes_in_group("hero_ui")
	for hero_child in hero_ui_children:
		hero_child.change_tab.connect(on_change_tab)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_current_tab():
	if %TabContainer.current_tab == %TabContainer.get_tab_count() - 1:
		%TabContainer.set_current_tab(0)
		# Put code that sends the attacks to the turn controller here, or call a function
	else:
		%TabContainer.set_current_tab(%TabContainer.current_tab + 1)
	if %TabContainer.get_current_tab_control().has_method("input_focus"):
		%TabContainer.get_current_tab_control().input_focus()
func on_change_tab():
	change_current_tab()


func _on_button_pressed() -> void:
	change_current_tab()
