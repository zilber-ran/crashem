extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50

var stop_speed = 100
var curr_speed = Vector2.ZERO
var VC = Node2D
var parent = Node2D

func _stop_slow() -> void:
	curr_speed = abs(get_linear_velocity().length())
	
	print_debug("speed: {}".format([curr_speed], "{}"))
	if curr_speed>0 and curr_speed <= stop_speed:
		print_debug("[STOP-PLAYER]")
		set_linear_velocity(Vector2.ZERO)
		VC.can_launch = true
	else: 
		print_debug("[CONT-PLAYER]")
func _process(delta):
	_stop_slow()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	 VC = get_node("VectorCreator")
	 # Replace with function body.

func _launch(force : Vector2) -> void:
	
	apply_impulse(Vector2.ZERO, force * speed)
	VC.can_launch = false
	VC._reset()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
