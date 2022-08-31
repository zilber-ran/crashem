extends RigidBody2D 

var mouse_pos = Vector2.ZERO
var events = PlayerInput.new()
var mouse_on_player = false
export var speed = 0



func _input(event):
	var mouse_event = events.handle_mouse(event);
	if InputAdaptor.MOUSE_EVENT.RELEASE == mouse_event && mouse_on_player == true:
		apply_impulse(Vector2.ZERO, events.direction*speed)
		events.mouse_reset()


func _on_mouse_entered():
	if mouse_on_player:
		return
	else:
		mouse_on_player = true
		print("mouse on player")


func _on_mouse_exited():
	mouse_on_player = false
	print("mouse outside")
