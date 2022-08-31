extends InputAdaptor
class_name PlayerInput

var pos_pressed = Vector2.ZERO
var pos_released = Vector2.ZERO
var direction = Vector2.ZERO

func on_mouse_press(event):
	pos_pressed = event.get_global_position()
	print(pos_pressed)

func on_mouse_release(event):
	pos_released = event.get_global_position() 
	print(pos_released)
	direction = pos_pressed - pos_released
	print(direction)
#	mouse_reset()
	
func on_mouse_drag(event):
	pos_released = event.get_global_position()

func mouse_reset() -> void:
	pos_pressed = Vector2.ZERO
	pos_released = Vector2.ZERO
	direction = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
