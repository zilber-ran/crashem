extends Node2D
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
var enemys

var board_size = 500

onready var temp_node2d = Node2D.new()


"""
=======================
		Methods
=======================
"""
func _process(var delta):
	var enemy_count = 0
	enemys = get_tree().get_nodes_in_group("Enemy")
	if enemys.size() == 0:
		next_game_level()



func next_game_level():
	level += 1
	if true: #replacing difficulty increase per level
		next_game_difficulty()
	load_level()


func load_level() ->void:
	calculate_player_launches()
#	manage_crawler_holes()
	activate_crawler_holes()

func next_game_difficulty():
	difficulty += 1
	
func get_enemy_groups():
	return ["enemy"]
	
func get_enemy_types():
#	return ENEMY_TYPES_PER_DIFICULTY.get(difficulty, ["NA"])
	return ["KinematicEnemy"]

func get_enemy_cluster_size():
	return 3
	
func get_calculated_difficulty():
	return ceil(pow(1.1, cos(difficulty))*difficulty)

func get_total_crawler_holes():
	return 2

func get_crawler_holes_pos_radius():
	return 500

func get_crawler_holes_spawn_radius():
	return 250
	
func calculate_player_launches() -> void:
	var remaning_launches = max_player_launches-current_player_launches
#	max_player_launches = PLAYER_LAUNCHES_PER_LEVEL[level]
	if remaning_launches > 0:
		max_player_launches += remaning_launches
	reset_player_launches()

func reset_player_launches()-> void:
	current_player_launches = 0

#func manage_crawler_holes() -> void:
#	var node2d = Node2D.new()
#	var crawler_holes =  node2d.get_tree().get_nodes_in_group("CrawlerHole")
#	if crawler_holes.get_node_count() == get_total_crawler_holes():
#		return
"Called by factory	 (～￣▽￣)～	"

func activate_crawler_holes() -> void:
	var crawler_factory = get_node("CrawlerHoleFactory")
	var crawlers = get_tree().get_nodes_in_group("CrawlerHole")
	for crawler in crawlers:
		crawler.activate(crawler_factory.get_player_position())


func _on_player_launched():
	current_player_launches += 1
