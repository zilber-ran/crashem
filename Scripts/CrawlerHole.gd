extends Node2D
class_name CrawlerHole

export var angle :int = -1
export var radius : int = 500
export var difficulty : int = 1
var spawn_factory = SpawnFactory.new()
var ctx = GameFlowContext.new()

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
	print_debug("angle={}, pos={}".format([angle, position], "{}"))
	

func spawnm():
	var size = ctx.get_enemy_cluster_size(difficulty)
	var types = ctx.get_enemy_types(difficulty)
	while size>0:
		for type in types:
			spawn_factory.load_and_spawn(type)
			


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	if not_positioned():
		random_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
