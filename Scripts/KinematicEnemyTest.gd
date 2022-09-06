extends BasicEnemy

var move_direction := Vector2.ZERO
onready var timer = get_node("Timer")


"move randomly"
func _physics_process(delta):
	move_and_slide(move_direction)
	

func _on_Timer_timeout():
	move_direction = VD.distort_vector2_Wlength(speed)
	#print(move_direction)

"kills on contact"
func _on_Collision_body_entered(body):
	if body.is_in_group("Player"):
		get_parent().remove_child(self) 

func _on_setup_called(_difficulty):
	setup(_difficulty)
	timer.wait_time = VD.distort(_difficulty)
