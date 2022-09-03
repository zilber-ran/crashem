class_name SpawnFactory
extends Node2D

var scene = null

## support for property editor (optional)
export(PackedScene) var scene_res_path

func load_and_spawn(scene_name):
	if not is_loaded():
		load_scene(scene_name)
	spawn()
	

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
	 
func spawn() -> void:
	if is_loaded():
		var child = scene.instance()
		add_child(child)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
