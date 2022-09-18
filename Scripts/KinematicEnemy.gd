extends BasicEnemy

var move_direction := Vector2.ZERO
onready var raycast = get_node("RayCast2D")



"move randomly"
func _physics_process(delta):
	var chosen_dir = _verify_movement()
	move_and_slide(chosen_dir)
	raycast.set_cast_to(chosen_dir.normalized()*1.5*speed)
	move_direction = chosen_dir

func _verify_movement():
	var md :Vector2 = move_direction
	if _verify(md):
		return md
	else:
		if _verify(Vector2(-md.x,md.y)):
			return Vector2(-md.x,md.y)
		elif _verify(Vector2(md.x,-md.y)):
			return Vector2(md.x,-md.y)
		else:
			return -md


func _verify(vector):
	raycast.set_cast_to(vector*timer.wait_time)
	if raycast.is_colliding():
		var body = raycast.get_collider()
		if body.is_in_group("Walls"):
			return false
	else:
		return true


func _random_direction():
	return VD.distort_vector2_Wlength(speed)

func _on_Timer_timeout():
	move_direction = _random_direction()
	#print(move_direction)

"kills on contact"
func _on_Collision_body_entered(body):
	if body.is_in_group("Player"):
		get_parent().remove_child(self) 

func _on_setup_called(_difficulty):
	setup(_difficulty)
	timer.set_wait_time(VD.calc_timer(calc_diff))
