extends Node

signal cheat_activated

'''
CHEATS GUIDE

Level Up Player Characters to Next Level -> Shift + L
Enable God Mode (Player Characters Take No Damage) -> Shift + G
Speed Hacks (Increases Speed by 5x) -> Shift + S
Teleport to Final Area -> Shift + F
'''

func _ready() -> void:
	set_process(false)

func _process(_delta: float) -> void:
	if Input.is_action_pressed("SHIFT"):
		if Input.is_action_just_pressed("KEY_L"):
			cheat_activated.emit("LVL")
		elif Input.is_action_just_pressed("KEY_G"):
			cheat_activated.emit("GOD")
		elif Input.is_action_just_pressed("KEY_S"):
			cheat_activated.emit("SPEED")
		elif Input.is_action_just_pressed("KEY_F"):
			cheat_activated.emit("TELEPORT")

func enable() -> void:
	set_process(true)
	print("CHEATS: ON")

func disable() -> void:
	set_process(false)
	print("CHEATS OFF")
