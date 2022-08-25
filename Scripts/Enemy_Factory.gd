extends SpawnFactory


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	load_scene("Enemy")



func _input(event):
	if event.is_action_pressed("ui_select"):
		print("space pressed")
		spawn()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
