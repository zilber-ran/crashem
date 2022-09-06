extends Object
class_name GameFlowContext

var ENEMY_TYPES_PER_DIFICULTY  = { 
	1 : ["E1", "E2"]
}

func get_enemy_groups():
	return ["enemy"]
	
func get_enemy_types(difficulty:int):
#	return ENEMY_TYPES_PER_DIFICULTY.get(difficulty, ["NA"])
	return ["KinematicEnemy"]

func get_enemy_cluster_size(difficulty:int):
	return 1
	
func get_calculated_difficulty(difficulty:int):
	return ceil(pow(1.1, cos(difficulty))*difficulty)
