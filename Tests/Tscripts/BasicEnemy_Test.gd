extends Node2D


onready var enemys = get_tree().get_nodes_in_group("Enemy")
export var difficulty :int = 5

func _input(event):
	if event.is_action_pressed("ui_accept"):
		for enemy in enemys:
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
