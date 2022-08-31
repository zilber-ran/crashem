extends RigidBody2D 

var mouse_pos = Vector2.ZERO
var events = PlayerInput.new()

func _ready():
	pass

func _input(event):
	var mouse_event = events.handle_mouse(event);
	if InputAdaptor.MOUSE_EVENT.RELEASE == mouse_event:
		apply_impulse(Vector2.ZERO, events.direction)
