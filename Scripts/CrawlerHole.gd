extends SpawnFactory
class_name CrawlerHole

var vd = ValueDistorter.new()
var ctx = GameFlowContext.new()

export var pos_radius : int = ctx.get_crawler_holes_pos_radius() #Should be from own script
export var spawn_radius : int = ctx.get_crawler_holes_spawn_radius() #Should be from own script
export var difficulty : int = ctx.difficulty
export var cluster_size :int = ctx.get_enemy_cluster_size()
export var player_position :Vector2 = Vector2.ZERO

onready var board_size = ctx.board_size

func is_positioned():
	return position != Vector2.ZERO

func not_positioned():
	return not is_positioned()
	
func random_position(center):
	"""
	sets  a random position
	"""
	var estimeted_pos = center + vd.distort_vector2_Wlength(pos_radius)
	if -board_size < estimeted_pos.x && estimeted_pos.x < board_size && \
	-board_size < estimeted_pos.y && estimeted_pos.y < board_size:
		position = estimeted_pos
		logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole random pos: {}", [position]))
		return
	else: random_position(center)

func create_enemy(type):
	var estimated_pos = vd.distort_vector2_Wlength(spawn_radius)
	var enemy = null
	if -board_size < estimated_pos.x && estimated_pos.x < board_size && \
	   -board_size < estimated_pos.y && estimated_pos.y < board_size:
			enemy = load_and_spawn(type)
			enemy.position = estimated_pos
			enemy._on_setup_called(difficulty)

func rotate_next_enemy_type(types):
	var type = types.pop_back()
	types.insert(0, type)
	return type
	
func spawnem():
	var cluster_size = ctx.get_enemy_cluster_size()
	var counter = cluster_size
	var types = ctx.get_enemy_types()
	var groups = ctx.get_enemy_groups()
	
	set_groups(groups)
	while counter>0:
		logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole enemy creation {} of {}", [cluster_size-counter+1, cluster_size]))
		for type in types:
			logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole enemy creation type: {}", [type]))
			create_enemy(type)
		counter -= 1

# Called when the node enters the scene tree for the first time.
#func _ready():
#	if not_positioned():
#		random_position(player_position)
#	spawnem()

func activate(in_player_position):
	player_position = in_player_position
	random_position(player_position)
	spawnem()
