extends RigidBody2D
enum COLLISION_MASK {WALLS, PLAYER, BALL, ENEMIES}

export var Health := 1
export var Speed := 5
export var Difficulty := 1
var VD = enemy_valdistorter.new()
var wake = false
var is_colliding = false
var ctx = GameFlowContext.new()

func setup(difficulty):
	var calc_diff = ctx.get_calculated_difficulty()
	wake = false
	Health = VD.calc_health(calc_diff)
	Speed = VD.calc_speed(calc_diff)
	
func move() -> void:
	pass

func attack() -> void:
# warning-ignore:unused_variable
	var dammage = VD.calc_dammage(Difficulty)




func _on_body_entered(body):
	print_debug("contacted object")
	if body.collision_mask ==  COLLISION_MASK.PLAYER || \
		COLLISION_MASK.BALL && is_colliding == false:
		is_colliding = true
		print_debug("is player or ball")
		
		Health += -1




func _on_body_exited(body):
	if body.collision_mask ==  COLLISION_MASK.PLAYER || \
		COLLISION_MASK.BALL :
		is_colliding = false
