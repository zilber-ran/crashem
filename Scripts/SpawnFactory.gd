class_name SpawnFactory
extends Node2D

var scene = null

## support for property editor (optional)
export var scene_res_path : String = ""
export var groups : Array = []
var logger = Logger.new()

func load_and_spawn(scene_name):
	if not is_loaded():
		load_scene(scene_name)
		logger.log_debug(logger.STATUS_PASSED, logger.format("Loaded scene: {}", [scene_name]))
	return spawn()
	
func set_groups(in_groups):
	self.groups.append_array(in_groups)

func load_scene(scene_name):
	"""
	fast loading implementation. 
	having big scen(s) we might need to swich using 
		ResoceLoader.load()
	"""
	if not scene_res_path:
		scene_res_path = 'res://Scenes/'+scene_name+'.tscn'
	scene = load(scene_res_path)
	
func is_loaded():
	return scene != null

func attach_groups(node):
	if self.groups:
			for grp in self.groups:
				node.add_to_group(grp)
				
func spawn():
	if is_loaded():
		var child = scene.instance()
		attach_groups(child)
		logger.log_debug(logger.STATUS_PASSED, logger.format("Attached groups: {}", self.groups))
		add_child(child)
		return child

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
