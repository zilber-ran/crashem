extends RigidBody2D

const Mouse_State = {State_Clicked = 0, State_Held = 1, State_Released = 2, State_Neutral=3}
var pos1 = Vector2.ZERO
var pos2 = Vector2.ZERO

func _input(event):
	match(Mouse_State.key):
		0:
			pos1 = get_global_mouse_position()
		1:
			pos2 = get_global_mouse_position()
		2:
			var thrust = Vector2(pos1-pos2).length()
			_launch(thrust)
		3:
			pass
			
func _launch(Thrust):
	pass
