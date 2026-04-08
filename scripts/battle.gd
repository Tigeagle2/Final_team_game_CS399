extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("connect_hero")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func connect_hero():
	%fight_screen_ui/TabContainer/hero_ui_1.linked_hero = %hero_infight_1
	%fight_screen_ui/TabContainer/hero_ui_1.setup_linked_hero()
	#%fight_screen_ui/TabContainer/hero_ui_2.linked_hero = %hero_infight_2
	#%fight_screen_ui/TabContainer/hero_ui_2.setup_linked_hero()
	#%fight_screen_ui/TabContainer/hero_ui_3.linked_hero = %hero_infight_3
	#%fight_screen_ui/TabContainer/hero_ui_3.setup_linked_hero()
	
