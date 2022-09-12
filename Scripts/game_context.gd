extends Object
class_name GameFlowContext



"""
=======================
	   Variables
=======================
"""

var ENEMY_TYPES_PER_LEVEL  = { 
	1 : ["E1", "E2"]
}

var DIFFICULTY_INCREASE_PER_LEVEL = {
	1: false , 2: true , 3: false ,
	4: false 
}

var ENEMY_CLUSTER_SIZE_PER_LEVEL = {
	1: 2, 2: 2, 3: 3
}

export var difficulty : int = 1
export var level : int = 1

var current_player_launches : int
var max_player_launches : int



"""
=======================
		Methods
=======================
"""

func next_game_level():
	level += 1
	if true: #replacing difficulty increase per level
		next_game_difficulty()
	load_level()


func load_level() ->void:
	calculate_player_launches()
	manage_crawler_holes()
	activate_crawler_holes()

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
	return 500

func get_crawler_holes_spawn_radius():
	return 50
	
func calculate_player_launches() -> void:
	pass

func manage_crawler_holes() -> void:
	pass

func activate_crawler_holes() -> void:
	pass
