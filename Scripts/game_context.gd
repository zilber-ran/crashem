extends Node2D
class_name GameFlowContext



"""
=======================
	   Variables
=======================
"""
export var cluster_aplitude : int = 0.6
export var cluster_min : int = 2

var ENEMY_TYPES_PER_LEVEL  = { 
	1 : ["E1", "E2"]
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
	if _should_incr_difficulty(): 
		next_game_difficulty()
	load_level()


func load_level() ->void:
	calculate_player_launches()
	activate_crawler_holes()

func next_game_difficulty():
	difficulty += 1
	
func get_enemy_groups():
	return ["enemy"]
	
func get_enemy_types():
#	return ENEMY_TYPES_PER_DIFICULTY.get(difficulty, ["NA"])
	return ["RedWizard","BlueWizard"]

func _should_incr_difficulty():
	return (level%2) > 0
	
func _get_player_lunches():
	return get_enemy_cluster_size()*get_total_crawler_holes()+1
	
func get_enemy_cluster_size():
	return floor(cluster_aplitude*cos(level)+cluster_min+0.1*level)
	
func get_calculated_difficulty():
	return ceil(pow(1.1, cos(difficulty))*difficulty)

func get_total_crawler_holes():
	return floor(pow(level,0.5)+1)

func get_crawler_holes_pos_radius():
	return 500

func get_crawler_holes_spawn_radius():
	return 250
	
func calculate_player_launches() -> void:
	var remaning_launches = max_player_launches-current_player_launches
	max_player_launches = _get_player_lunches()
	if remaning_launches > 0:
		max_player_launches += remaning_launches
	reset_player_launches()

func reset_player_launches()-> void:
	current_player_launches = 0

func activate_crawler_holes() -> void:
	var crawler_factory = get_node("CrawlerHoleFactory")
	var crawlers = get_tree().get_nodes_in_group("CrawlerHole")
	for crawler in crawlers:
		crawler.activate(crawler_factory.get_player_position())


func _on_player_launched():
	current_player_launches += 1
