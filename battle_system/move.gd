class_name Move extends Resource

@export var move_name: String
@export var animation_name: StringName
@export var rebound_animation_name: StringName
@export var target_animation_name: StringName
@export var energy_cost: int
@export var speed_mult: float
@export var target_num: int = 1

func resolve_move(owner: Battler, targets: Array[Battler]):
	await owner.play_animation(animation_name)
	await apply_change(owner, targets)
	for target in targets:
		target.play_animation(target_animation_name)
	await owner.play_animation(rebound_animation_name)


func apply_change(owner: Battler, targets: Array[Battler]):
	pass
