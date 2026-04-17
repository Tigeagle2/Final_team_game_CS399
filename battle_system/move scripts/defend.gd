class_name Defend extends Move

func apply_change(owner: Battler, targets: Array[Battler]):
	owner.defend()