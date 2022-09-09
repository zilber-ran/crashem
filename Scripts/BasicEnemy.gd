extends KinematicBody2D
class_name BasicEnemy
enum COLLISION_MASK {WALLS, PLAYER, BALL, ENEMIES}

export var health := 1
export var speed := 5
export var difficulty := 1
var calc_diff : float
var VD = EnemyDistorter.new()
var is_wake = true
var ctx = GameFlowContext.new()

func setup(difficulty):
	calc_diff = ctx.get_calculated_difficulty()
	is_wake = true
	health = VD.calc_health(difficulty)
	speed = VD.calc_speed(calc_diff)
	self.difficulty = difficulty


func move() -> void:
	pass

