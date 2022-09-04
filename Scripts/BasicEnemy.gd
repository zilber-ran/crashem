extends RigidBody2D
enum COLLISION_MASK {WALLS, PLAYER, BALL, ENEMIES}

export var health := 1
export var speed := 5
export var difficulty := 1
var dammage :int
var VD = EnemyDistorter.new()
var wake = false
var is_colliding = false
var ctx = GameFlowContext.new()

func setup(difficulty):
	var calc_diff = ctx.get_calculated_difficulty(difficulty)
	wake = false
	health = VD.calc_health(difficulty)
	speed = VD.calc_speed(calc_diff)
	self.difficulty = difficulty


func move() -> void:
	pass

func attack() -> void:
# warning-ignore:unused_variable
	 dammage = VD.calc_dammage(difficulty)




func _on_body_entered(body):
	print_debug("contacted object")
	if body.collision_mask ==  COLLISION_MASK.PLAYER || \
		COLLISION_MASK.BALL && is_colliding == false:
		is_colliding = true
		print_debug("is player or ball")
		
		health += -1




func _on_body_exited(body):
	if body.collision_mask ==  COLLISION_MASK.PLAYER || \
		COLLISION_MASK.BALL :
		is_colliding = false
