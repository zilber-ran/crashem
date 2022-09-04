extends Node2D


onready var enemy = get_node("BasicEnemy")
export var difficulty :int = 5

func _input(event):
	if event.is_action_pressed("ui_accept"):
		enemy.setup(difficulty)
		print("=========")
		print("difficulty ",difficulty)
		print("Health ", enemy.health)
		print("Speed ", enemy.speed)
		print("EnemyDifficulty ", enemy.difficulty)
		enemy.attack()
		print("Rolled Attack Stat ", enemy.dammage)
	elif event.is_action_pressed("ui_down"):
		difficulty += -1
		print("difficulty was lowered to ", difficulty)
	elif event.is_action_pressed("ui_up"):
		difficulty += 1
		print("difficulty was raised to ", difficulty)
