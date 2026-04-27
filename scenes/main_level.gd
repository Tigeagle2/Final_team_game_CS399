extends Node2D

@export var battle_menu: Menu
@export var cover: ColorRect
@export var player: CharacterBody2D
@export var bg_music: AudioStreamPlayer

var battle_menu_path: PackedScene = load("res://scenes/battle_menu.tscn")

func _ready() -> void:
	bg_music.play()
	uncover_screen()

func trigger_battle() -> void:
	var camera: Camera2D = player.camera
	
	cover_screen()
	
	var tween = create_tween()
	tween.tween_property(camera, "zoom", Vector2(1.1, 1.1), 1.0).set_trans(Tween.TRANS_SINE)
	
	await get_tree().create_timer(2.0).timeout
	
	camera.zoom = Vector2(1, 1)
	battle_menu.show()
	battle_menu.summon()
	
	await get_tree().create_timer(battle_menu.slide_duration).timeout
	
	uncover_screen()

func end_battle() -> void:
	player.battle_won()
	var camera: Camera2D = player.camera
	
	cover_screen()
	
	var tween = create_tween()
	tween.tween_property(camera, "zoom", Vector2(1.1, 1.1), 1.0).set_trans(Tween.TRANS_SINE)
	
	await get_tree().create_timer(2.0).timeout
	
	camera.zoom = Vector2(1, 1)
	battle_menu.release()
	
	await get_tree().create_timer(battle_menu.slide_duration).timeout
	get_tree().reload_current_scene()

func game_over() -> void:
	player.battle_won()
	var camera: Camera2D = player.camera
	
	cover_screen()
	
	var tween = create_tween()
	tween.tween_property(camera, "zoom", Vector2(1.1, 1.1), 1.0).set_trans(Tween.TRANS_SINE)
	
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/MENUS/GameOver.tscn")

func cover_screen() -> void:
	cover.show()
	var tween = create_tween()
	tween.tween_property(cover, "color", Color(0, 0, 0, 1), 2.0)

func uncover_screen() -> void:
	var tween = create_tween()
	tween.tween_property(cover, "color", Color(0, 0, 0, 0), 2.0)
	
	await get_tree().create_timer(2.0).timeout
	cover.hide()
