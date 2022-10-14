extends BasicEnemy

var move_direction := Vector2.ZERO
onready var raycast = get_node("RayCast2D")
var player_detected := false
var player
onready var escape_timer = get_node("Escape_Timer")


"move randomly"
func _physics_process(delta):
	var escape_dir:Vector2
	var escape_dir_varified = false
	if player_detected&&!escape_timer.is_stopped():
		escape_dir = Vector2(self.position - player.position)
		escape_dir_varified = _verify(escape_dir)
	if escape_dir_varified:
#		_flip_sprite(escape_dir.x)
		move_and_slide(escape_dir.normalized()*4*speed)
	else:
		var chosen_dir = _verify_movement()
		if !player_detected:	_flip_sprite(chosen_dir.normalized().x)
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

func _flip_sprite(x):
	var sprite = get_node("Sprite")
	if x < 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false


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


func _on_Player_Detection_body_entered(body):
	if body.is_in_group("Player"):
		player = body
		player_detected = true
		escape_timer.start()


func _on_Player_Detection_body_exited(body):
	if body.is_in_group("Player"):
		player_detected = false
