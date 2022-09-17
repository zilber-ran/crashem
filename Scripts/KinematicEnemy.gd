extends BasicEnemy

var move_direction := Vector2.ZERO
onready var raycast = get_node("RayCast2D")



"move randomly"
func _physics_process(delta):
	var estimated_location = move_direction+ position
	raycast.set_cast_to(move_direction*timer.wait_time)
	if raycast.is_colliding():
		var body = raycast.get_collider()
		if body.is_in_group("Walls"):
			move_and_slide(-position*speed)
			return
	else:
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
	timer.set_wait_time(VD.calc_timer(calc_diff))
