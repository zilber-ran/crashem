extends SpawnFactory
class_name CrawlerHole

var vd = ValueDistorter.new()
var ctx = GameFlowContext.new()

export var pos_radius : int = ctx.get_crawler_holes_pos_radius() #Should be from own script
export var spawn_radius : int = ctx.get_crawler_holes_spawn_radius() #Should be from own script
export var difficulty : int = ctx.difficulty
export var cluster_size :int = ctx.get_enemy_cluster_size()
export var player_position :Vector2 = Vector2.ZERO

func is_positioned():
	return position != Vector2.ZERO

func not_positioned():
	return not is_positioned()
	
func random_position(center):
	"""
	sets  a random position
	"""
	position = center + vd.distort_vector2_Wlength(pos_radius)
	logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole random pos: {}", [position]))
	

func spawnem():
	var cluster_size = ctx.get_enemy_cluster_size()
	var counter = cluster_size
	var types = ctx.get_enemy_types()
	var groups = ctx.get_enemy_groups()
	var enemy = null
	set_groups(groups)
	while counter>0:
		logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole enemy creation {} of {}", [cluster_size-counter+1, cluster_size]))
		for type in types:
			enemy = load_and_spawn(type)
			enemy.position = vd.distort_vector2_Wlength(spawn_radius)
#			enemy.setup(difficulty)
		counter -= 1

# Called when the node enters the scene tree for the first time.
#func _ready():
#	if not_positioned():
#		random_position(player_position)
#	spawnem()

func activate(in_player_position):
	player_position = in_player_position
	if not_positioned():
		random_position(player_position)
	spawnem()
