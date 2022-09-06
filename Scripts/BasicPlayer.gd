extends RigidBody2D 

var mouse_pos = Vector2.ZERO
var curr_speed = Vector2.ZERO
var stop_speed = 100

var events = PlayerInput.new()
var mouse_on_player = false
export var speed = 0
export var boost_multiplyer = 1



func _input(event):
	var mouse_event = events.handle_mouse(event);
	var boost : float
	if InputAdaptor.MOUSE_EVENT.PRESS == mouse_event:
		boost = get_linear_velocity().length()*boost_multiplyer
		set_linear_velocity(Vector2.ZERO)
		
	elif InputAdaptor.MOUSE_EVENT.RELEASE == mouse_event && mouse_on_player == true:
		apply_impulse(Vector2.ZERO, events.direction*speed + events.direction*boost)
		print("boost is ", boost)
		events.mouse_reset()

func _stop_slow() -> void:
	curr_speed = abs(get_linear_velocity().length())
	
	print("speed: {}".format([curr_speed], "{}"))
	if curr_speed>0 and curr_speed <= stop_speed:
		print("[STOP-PLAYER]")
		set_linear_velocity(Vector2.ZERO)
	else: 
		print("[CONT-PLAYER]")

func _on_mouse_entered():
	if mouse_on_player:
		return
	else:
		mouse_on_player = true
		print("mouse on player")


func _on_mouse_exited():
	if !mouse_on_player:
		return
	else:
		mouse_on_player = false
		print("mouse outside")
