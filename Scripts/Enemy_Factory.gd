extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var enemy_scene = load("res://Scenes/Enemy.tscn")

func _summon_enemy() -> void:
	var enemy = enemy_scene.instance()
	add_child(enemy)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action_pressed("ui_select"):
		print("space pressed")
		_summon_enemy()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
