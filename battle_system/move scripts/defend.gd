extends Move

func apply_change(owner: Battler, targets: Array[Battler]):
	owner.defend()