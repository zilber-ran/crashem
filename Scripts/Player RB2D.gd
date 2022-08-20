extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _launch(force : Vector2) -> void:
	
	apply_impulse(Vector2.ZERO, force * speed)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
