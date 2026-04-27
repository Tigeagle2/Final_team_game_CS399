extends Node2D

@export var text_box: RichTextLabel
@export var enemy_1_marker: Marker2D
@export var enemy_2_marker: Marker2D
@export var enemy_3_marker: Marker2D
@export var fight_screen: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("link_battler")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func link_battler():
	%fight_screen_ui.hero_ui_1.battler = %hero_infight_1/Battler
	%fight_screen_ui.hero_ui_2.battler = %hero_infight_2/Battler
	%fight_screen_ui.hero_ui_3.battler = %hero_infight_3/Battler
	%fight_screen_ui.hero_ui_1.setup_battler()
	%fight_screen_ui.hero_ui_2.setup_battler()
	%fight_screen_ui.hero_ui_3.setup_battler()

func add_text_line(text: String) -> void:
	text_box.text += text + "\n"

func clear_text() -> void:
	text_box.text = ""

func get_random_enemies() -> void:
	clear_text()
	for num in range(1, 4):
		var id_1: int = randi_range(1, 2)
		var id_2: int = randi_range(1, 5)
		
		var enemy_scene: PackedScene = load("res://scenes/Player/Enemy_" + str(id_1) + "_" + str(id_2) + ".tscn")
		var enemy = enemy_scene.instantiate()
		
		if num == 1:
			enemy_1_marker.set_random_name(1)
			enemy_1_marker.enemy = enemy
			enemy_1_marker.call_deferred("add_child", enemy)
		elif num == 2:
			enemy_2_marker.set_random_name(2)
			enemy_2_marker.enemy = enemy
			enemy_2_marker.call_deferred("add_child", enemy)
		else:
			enemy_3_marker.set_random_name(3)
			enemy_3_marker.enemy = enemy
			enemy_3_marker.call_deferred("add_child", enemy)
