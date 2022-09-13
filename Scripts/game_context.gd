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

export var ENEMY_CLUSTER_SIZE_PER_LEVEL =  {
	1: 2, 2: 2, 3: 3
}

var PLAYER_LAUNCHES_PER_LEVEL = {
	1: 5, 2:5, 3:4
}

var TOTAL_CRAWLER_HOLES_PER_LEVEL = {
	1:2, 2:2, 3:1, 4:2
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
#	manage_crawler_holes()
#	activate_crawler_holes()

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
	var remaning_launches = max_player_launches-current_player_launches
	max_player_launches = PLAYER_LAUNCHES_PER_LEVEL[level]
	if remaning_launches >> 0:
		max_player_launches += remaning_launches


#func manage_crawler_holes() -> void:
#	var node2d = Node2D.new()
#	var crawler_holes =  node2d.get_tree().get_nodes_in_group("CrawlerHole")
#	if crawler_holes.get_node_count() == get_total_crawler_holes():
#		return
"Called by factory	 (～￣▽￣)～	"

#func activate_crawler_holes() -> void:
#	pass
"Called by factory	 ＼（〇_ｏ）／	"
