extends Node2D
class_name CrawlerHole

export var angle :int = -1
export var radius : int = 500
export var difficulty : int = 1
var spawn_factory = SpawnFactory.new()
var ctx = GameFlowContext.new()
var logger = Logger.new()

func set_radius(radius : int):
	self.radius = radius
	 
func set_position(pos : Vector2):
	if pos:
		position = pos
		
func is_positioned():
	return position != Vector2.ZERO

func not_positioned():
	return not is_positioned()
	
func random_position():
	"""
	sets  a random position
	"""
	angle = randi() % 360
	position = Vector2(radius*cos(angle), radius*sin(angle))
	logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole random place: angle: {}, pos: {}", [angle, position]))
	

func spawnem():
#	var total = ctx.get_enemy_cluster_size(difficulty)
	var total = 3
	var counter = total
	var types = ctx.get_enemy_types(difficulty)
	var groups = ctx.get_enemy_groups()
	spawn_factory.set_groups(groups)
	while counter>0:
		logger.log_debug(logger.STATUS_PASSED, logger.format("CrollerHole enemy creation {} of {}", [total-counter+1, total]))
		for type in types:
			spawn_factory.load_and_spawn(type, position)
		counter -= 1


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if not_positioned():
		random_position()
		spawnem()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
