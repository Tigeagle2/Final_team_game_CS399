@abstract
class_name Move extends Resource

@export var animation_name: StringName
@export var energy_cost: int
@export var speed_mult: float

func resolve_move(owner: Battler, targets: Array[Battler]):
	pass