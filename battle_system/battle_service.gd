extends Node

var turn_resolver

const BATTLE_PATH := "res://scenes/battle.tscn"

func set_turn_resolver(_turn_resolver: TurnResolver):
	turn_resolver = _turn_resolver

func get_same_team_from_battler(battler: Battler) -> Array[Battler]:
	var team_controller: TeamController
	for team in turn_resolver.teams_array:
		if battler in team.battler_array:
			team_controller = team
	return team_controller.battler_array

func get_opposite_team_from_battler(battler: Battler) -> Array[Battler]:
	# gonna try to get the opposite team from a single battler
	var team_controller: TeamController
	for team in turn_resolver.teams_array:
		if battler in team.battler_array:
			team_controller = team
	
	return turn_resolver.get_opposite_team_array(team_controller)

func start_combat():
	var root := get_tree().current_scene
	
	var battle_scene = load(BATTLE_PATH)
	root.add_child(battle_scene)
	root.process_mode = Node.PROCESS_MODE_DISABLED
	battle_scene.process_mode = Node.PROCESS_MODE_ALWAYS
