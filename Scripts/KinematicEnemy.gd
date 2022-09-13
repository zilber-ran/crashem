extends BasicEnemy

var move_direction := Vector2.ZERO



"move randomly"
func _physics_process(delta):
	var estimated_location = move_direction+ position
	var board_size = float(ctx.board_size)
	if -board_size < estimated_location.x && estimated_location.x < board_size && \
	-board_size < estimated_location.y && estimated_location.y < board_size:
		move_and_slide(move_direction)
	else:
		move_and_slide(-position.normalized()*speed)
	

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
