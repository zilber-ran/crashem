extends Object
class_name GameFlowContext

var ENEMY_TYPES_PER_DIFICULTY  = { 
	1 : ["E1", "E2"]
}

export var difficulty : int = 1


func next_game_difficulty():
	difficulty += 1
	
func get_enemy_groups():
	return ["enemy"]
	
func get_enemy_types():
#	return ENEMY_TYPES_PER_DIFICULTY.get(difficulty, ["NA"])
	return ["KinematicEnemy"]

func get_enemy_cluster_size():
	return 10
	
func get_calculated_difficulty():
	return ceil(pow(1.1, cos(difficulty))*difficulty)

func get_total_crawler_holes():
	return self.get_calculated_difficulty()+3

func get_crawler_holes_pos_radius():
	return 70

func get_crawler_holes_spawn_radius():
	return 50
	
